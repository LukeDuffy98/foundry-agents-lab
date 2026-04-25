# Operator Guide

This document is for the person wiring the lab into LabDesktops and validating the session before participants arrive.

## Delivery Model

This repository assumes:

1. One student-facing lab flow.
2. A shared Azure AI Foundry hub or project host for the heavy platform components.
3. A shared model deployment sized for concurrent workshop usage.
4. Optional lightweight per-student resources created inside each student resource group.

## Lab Overview

This is a 75-minute, UI-only lab. Participants:

1. Create a model deployment.
2. Create a single agent and iterate on it throughout the session.
3. Add knowledge, tools, guardrails, and observability to the same agent.

No code or CLI is required. Every step uses the Azure AI Foundry portal.

## Canonical Values

- `labId`: `foundry-agents-lab`
- `readmePath`: `labs/foundry-agents-lab/README.md`
- `instructionsTitle`: `Azure AI Foundry & Agents Lab Guide`

## Shared Resources Checklist

Provision these outside the student resource group unless there is a strong isolation reason:

1. Azure AI Foundry hub and at least one project per student or a shared project with per-student access.
2. Shared model deployment sized for concurrent workshop usage (for example, `gpt-4o` with adequate TPM quota).
3. Workshop knowledge file available for participants to download or already uploaded to a shared Files location.
4. A simple tool endpoint accessible from the Foundry UI (for example, a Bing grounding connection or a pre-configured function tool).
5. Content filters and block lists pre-configured at the hub level so students can observe them without needing admin access.

## Per-Student Resources Checklist

This repo includes a starter Bicep template for per-student resource group deployment.

Use per-student deployment only for resources that must be isolated, such as:

1. A lightweight storage account for uploads or temporary artefacts.
2. A student-specific resource needed for permissions or naming isolation.

Do not put large, slow, or quota-sensitive services into the per-student deployment path unless you have tested the startup time under realistic concurrency.

## Pre-Event Validation

1. Confirm the repo is publicly cloneable or otherwise reachable by the desktop container.
2. Confirm the rendered guide path exists exactly at `labs/foundry-agents-lab/README.md`.
3. Confirm every image and document link in the student guide uses a relative path.
4. Confirm the lab guide does not duplicate credentials or guardrails already injected by LabDesktops.
5. Confirm the Template Spec version ID is current and points at the latest approved Bicep deployment.
6. Launch at least one student session end to end and time the provisioning flow.
7. Run through the full 75-minute lab yourself before the event to identify any environment gaps.
8. Confirm content filter policies are active and that a test block fires correctly in the Foundry portal.
9. Confirm the tool configured for Lab 5 is reachable and returns a visible result during the agent test.
10. Confirm trace or monitoring data appears after at least one agent interaction.

## Facilitation Notes

1. Give students the generated LabDesktops URL with `studentId` and `labId` already included.
2. Keep the student guide stable during the event unless a correction is necessary.
3. If you update the guide during rehearsal, refresh the instructions pane to verify the change renders correctly.
4. Keep a short list of known issues and workarounds beside the delivery console.
5. The lab uses one agent throughout. Remind participants not to create a new agent for each section.
6. If students run ahead, point them to the optional refinement steps in each section rather than letting them skip sections.
7. Labs 6 and 7 (guardrails and observability) require hub-level or policy-level access. Confirm before the event that participants can view but not necessarily edit these settings.

## Time Budget Reference

| Section | Purpose | Budget |
|---|---|---|
| Lab 0 | Orientation | ~5 min |
| Lab 1 | Model deployment | ~5 min |
| Lab 2 | Agent + instructions | ~10 min |
| Lab 3 | Knowledge | ~10 min |
| Lab 4 | Refine instructions | ~8 min |
| Lab 5 | Add a tool | ~10 min |
| Lab 6 | Guardrails | ~7 min |
| Lab 7 | Observability | ~7 min |
| Lab 8 | Capability awareness | ~8 min |
| Lab 9 | Wrap-up | ~5 min |
| **Total** | | **~75 min** |

## Post-Event Cleanup

Use the LabDesktops cleanup or reset workflow to remove expired student environments and any associated state.

If this repo evolves after the event, keep the `readmePath` stable unless you are also updating the LabDesktops catalog entry.
