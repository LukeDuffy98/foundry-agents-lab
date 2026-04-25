# LabDesktops Integration

This file captures the exact values and steps needed to wire this repository into the LabDesktops catalog.

## Lab Definition

Recommended values:

```json
{
  "foundry-agents-lab": {
    "repoUrl": "https://github.com/<owner>/<repo>",
    "repoBranch": "main",
    "readmePath": "labs/foundry-agents-lab/README.md",
    "instructionsTitle": "Azure AI Foundry & Agents Lab Guide",
    "instructionsGuardrails": "Stay within the provided subscription and project for this session. Do not create resources outside your assigned resource group.",
    "studentRgTemplateSpecVersionId": "/subscriptions/<subId>/resourceGroups/rg-lab-infra/providers/Microsoft.Resources/templateSpecs/foundry-agents-lab-student-resources/versions/v1"
  }
}
```

## Integration Steps

1. Publish [infra/labs/foundry-agents-lab/student-resources.bicep](../infra/labs/foundry-agents-lab/student-resources.bicep) as a Template Spec version.
2. Capture the resulting Template Spec version resource ID.
3. Replace the placeholder values in the JSON above.
4. Base64-encode the final JSON object for use in `LAB_CATALOG_JSON_B64`.
5. Set `LAB_DEFAULT_ID` only if this should be the fallback lab when `labId` is omitted.

## Publish Example

From the LabDesktops repository, the existing publish script can be used with this repo's Bicep file path after copying or referencing the template in the expected location.

Example command shape:

```powershell
./publish-template-spec.ps1 `
  -TemplateSpecName foundry-agents-lab-student-resources `
  -Version v1 `
  -TemplateFile infra/labs/foundry-agents-lab/student-resources.bicep
```

## Guardrails Guidance

Good guardrails are short and operational. They should tell students what not to touch, for example:

1. Stay inside your assigned resource group and Foundry project.
2. Use only the prepared model deployment and workshop assets.
3. Do not create extra high-cost resources or additional model deployments.
4. Do not modify shared hub-level settings or content filter policies.

Keep this text in the LabDesktops catalog, not in the student guide, so it appears in the injected banner.
