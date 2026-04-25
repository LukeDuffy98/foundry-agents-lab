# Azure AI Foundry & Agents Lab

This repository is a clean starting point for a LabDesktops-delivered workshop.

It is structured around the current LabDesktops integration model:

- A single student-facing Markdown guide rendered from a stable `LAB_README_PATH`
- Relative assets stored with the lab content
- Operator-facing documentation separated from student instructions
- A per-student resource-group Bicep template that can be published as a Template Spec and referenced from `LAB_CATALOG_JSON_B64`

## Intended LabDesktops Values

- `labId`: `foundry-agents-lab`
- `repoUrl`: set to this repository URL
- `repoBranch`: `main`
- `readmePath`: `labs/foundry-agents-lab/README.md`
- `instructionsTitle`: `Azure AI Foundry & Agents Lab Guide`

## Repository Layout

```text
.
|- README.md
|- LABS_MANIFEST.json
|- .gitignore
|- docs/
|  |- operator-guide.md
|  |- labdesktops-integration.md
|  \- lab-catalog.example.json
|- infra/
|  \- labs/
|     \- foundry-agents-lab/
|        \- student-resources.bicep
\- labs/
   \- foundry-agents-lab/
      |- README.md
      \- assets/
```

## Student Guide

The LabDesktops desktop should render:

- [labs/foundry-agents-lab/README.md](labs/foundry-agents-lab/README.md)

Do not duplicate sign-in credentials or top-of-guide guardrails in the student instructions. LabDesktops already injects those into the in-desktop banner.

## Operator Docs

- [docs/operator-guide.md](docs/operator-guide.md)
- [docs/labdesktops-integration.md](docs/labdesktops-integration.md)

## Infrastructure

The per-student resource-group deployment template is here:

- [infra/labs/foundry-agents-lab/student-resources.bicep](infra/labs/foundry-agents-lab/student-resources.bicep)

It is intentionally small so session startup stays fast. Heavy or quota-sensitive resources should stay shared and pre-provisioned outside the student resource group.

## Next Customization Pass

1. Replace the placeholder scenario text in the student guide with the final event narrative.
2. Add screenshots and files under `labs/foundry-agents-lab/assets/` using relative links only.
3. Decide which resources must be isolated per student and extend the Bicep template only for those.
4. Publish the Bicep file as a Template Spec and wire the resulting version ID into the LabDesktops catalog.