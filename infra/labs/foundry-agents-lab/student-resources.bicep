targetScope = 'resourceGroup'

@description('Student identifier as supplied to LabDesktops.')
param studentId string

@description('Lab identifier from the LabDesktops catalog entry.')
param labId string

@description('Name of the student resource group being provisioned.')
param resourceGroupName string

@description('Location for resources created in the student resource group.')
param location string = resourceGroup().location

@description('Set to true to create a lightweight student storage account.')
param createStudentStorage bool = false

@description('Short value applied to tags on resources created by this template.')
param labSystemTag string = 'labmachines'

var suffixBase = toLower(replace('${labId}${studentId}', '-', ''))
var suffix = take(suffixBase, 18)
var storageAccountName = take('lab${suffix}', 24)

resource studentStorage 'Microsoft.Storage/storageAccounts@2023-05-01' = if (createStudentStorage) {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
  tags: {
    'lab-student-id': studentId
    'lab-id': labId
    'lab-resource-group': resourceGroupName
    'lab-system': labSystemTag
  }
}

output deploymentSummary object = {
  labId: labId
  studentId: studentId
  resourceGroupName: resourceGroupName
  location: location
  createdStudentStorage: createStudentStorage
}

output studentStorageAccountName string = createStudentStorage ? studentStorage.name : ''
