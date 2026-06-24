# NAV-SLUG-MAP — BASE docs (Wave 2 authoring contract)

This file is the **binding contract** between Wave 1 (navigation IA, owned by Task
T2 / `docs.json`) and Wave 2 (`.mdx` page authoring). Every `pages` slug declared
in `docs.json` appears here exactly once with: the target `.mdx` path, the page
title, the primary audience, and the **source repo** the content must be derived
from.

## Rules for Wave 2 authors
- Create the `.mdx` file at the path in the **File** column (relative to
  `/projects/baseintelligence/docs/`). The slug in `docs.json` omits the `.mdx`
  extension.
- **Source precedence:** `base` (canonical, package `platform_network`, netuid
  **100**) wins on every conflict. See `SOURCES.md`.
- Never source from `PlatformNetwork/platform` (linked from baseagent README; it is
  NOT BASE).
- Brand: acid red `#d91f35`; success `#b2ff22` only for true "success" semantics;
  body font Rethink Sans, code font Space Mono. No starter greens.
- `index` and `quickstart` already exist in the starter — extend, do not recreate.
- Do not add a page that is not in this map without also updating `docs.json`.

Audience legend: **All** · **Miner** · **Validator** · **Agent dev** · **PRISM
user** · **Operator/infra** · **Integrator**

---

## Tab: Overview
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| index | index.mdx | Welcome to BASE | All | base (README), SOURCES.md |
| concepts/overview | concepts/overview.mdx | What is BASE? | All | base |
| concepts/how-it-works | concepts/how-it-works.mdx | How the subnet works | All | base |
| concepts/challenges | concepts/challenges.mdx | Challenges explained | All | base, agent-challenge, prism |
| concepts/miners-and-validators | concepts/miners-and-validators.mdx | Miners & validators | All | base |
| concepts/weights-and-emissions | concepts/weights-and-emissions.mdx | Weights & emissions | All | base (weight-setting) |
| concepts/incentive-mechanism | concepts/incentive-mechanism.mdx | Incentive mechanism | All | base |
| concepts/glossary | concepts/glossary.mdx | Glossary | All | base, SOURCES.md |
| quickstart | quickstart.mdx | Quickstart | All | base (CLI) |
| concepts/installation | concepts/installation.mdx | Installation | All | base (deploy/install) |
| concepts/wallets-and-registration | concepts/wallets-and-registration.mdx | Wallets & registration | All | base, Bittensor docs |

## Tab: Miners
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| miners/overview | miners/overview.mdx | Mining on BASE | Miner | base |
| miners/quickstart | miners/quickstart.mdx | Miner quickstart | Miner | base (miner CLI) |
| miners/installation | miners/installation.mdx | Install the miner | Miner | base (deploy) |
| miners/wallet-registration | miners/wallet-registration.mdx | Wallet & registration | Miner | base |
| miners/choose-a-challenge | miners/choose-a-challenge.mdx | Choosing a challenge | Miner | base, agent-challenge, prism |
| miners/submitting | miners/submitting.mdx | Submitting your work | Miner | base (upload protocol) |
| miners/authentication | miners/authentication.mdx | Authentication & signing | Miner | base (upload protocol) |
| miners/monitoring | miners/monitoring.mdx | Monitoring & logs | Miner | base |
| miners/troubleshooting | miners/troubleshooting.mdx | Troubleshooting | Miner | base |
| miners/migration-baseagent | miners/migration-baseagent.mdx | Migrating from baseagent | Miner | baseagent, base |

## Tab: Validators
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| validators/overview | validators/overview.mdx | Validating on BASE | Validator | base |
| validators/quickstart | validators/quickstart.mdx | Validator quickstart | Validator | base (validator CLI) |
| validators/installation | validators/installation.mdx | Install the validator | Validator | base (deploy) |
| validators/running | validators/running.mdx | Running a validator | Validator | base (validator) |
| validators/weight-setting | validators/weight-setting.mdx | Weight setting | Validator | base (weight-setting) |
| validators/submitter | validators/submitter.mdx | The submitter | Validator | base (submitter) |
| validators/configuration | validators/configuration.mdx | Configuration | Validator | base (settings) |
| validators/monitoring | validators/monitoring.mdx | Monitoring & logs | Validator | base |
| validators/troubleshooting | validators/troubleshooting.mdx | Troubleshooting | Validator | base |

## Tab: Agent Developers
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| agents/overview | agents/overview.mdx | Building agents | Agent dev | agent-challenge, baseagent |
| agents/quickstart | agents/quickstart.mdx | Agent quickstart | Agent dev | baseagent |
| agents/baseagent | agents/baseagent.mdx | The baseagent template | Agent dev | baseagent |
| agents/architecture | agents/architecture.mdx | Agent architecture | Agent dev | agent-challenge, baseagent |
| agents/configuration | agents/configuration.mdx | Agent configuration | Agent dev | baseagent |
| agents/tools | agents/tools.mdx | Tools & capabilities | Agent dev | agent-challenge, baseagent |
| agents/submitting | agents/submitting.mdx | Submitting an agent | Agent dev | agent-challenge, base |
| agents/evaluation | agents/evaluation.mdx | How agents are evaluated | Agent dev | agent-challenge |
| agents/best-practices | agents/best-practices.mdx | Best practices | Agent dev | agent-challenge, baseagent |

## Tab: PRISM
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| prism/overview | prism/overview.mdx | PRISM overview | PRISM user | prism |
| prism/quickstart | prism/quickstart.mdx | PRISM quickstart | PRISM user | prism |
| prism/how-it-works | prism/how-it-works.mdx | How PRISM works | PRISM user | prism |
| prism/submit | prism/submit.mdx | Submitting to PRISM | PRISM user | prism |
| prism/context | prism/context.mdx | Providing context | PRISM user | prism |
| prism/scoring | prism/scoring.mdx | Scoring | PRISM user | prism |
| prism/constraints | prism/constraints.mdx | Constraints & limits | PRISM user | prism |
| prism/examples | prism/examples.mdx | Examples | PRISM user | prism |
| prism/api | prism/api.mdx | PRISM API | Integrator | prism |
| prism/operators | prism/operators.mdx | Running PRISM | Operator/infra | prism, base |

## Tab: Reference
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| reference/cli | reference/cli.mdx | CLI overview | All | base (CLI) |
| reference/cli-master | reference/cli-master.mdx | Master CLI | Operator/infra | base (CLI) |
| reference/cli-validator | reference/cli-validator.mdx | Validator CLI | Validator | base (CLI) |
| reference/cli-challenge | reference/cli-challenge.mdx | Challenge CLI | Agent dev | base (CLI) |
| reference/cli-db-registry | reference/cli-db-registry.mdx | DB & registry CLI | Operator/infra | base (CLI, db/registry) |
| reference/api | reference/api.mdx | API overview | Integrator | base (proxy/api) |
| reference/api-proxy | reference/api-proxy.mdx | Proxy API | Integrator | base (proxy) |
| reference/api-admin | reference/api-admin.mdx | Admin API | Operator/infra | base |
| reference/api-weights | reference/api-weights.mdx | Weights API | Validator | base (weight-setting) |
| reference/configuration | reference/configuration.mdx | Configuration overview | All | base (settings) |
| reference/settings | reference/settings.mdx | Settings reference | All | base (settings/validator) |
| reference/config-examples | reference/config-examples.mdx | Configuration examples | All | base |
| reference/upload-protocol | reference/upload-protocol.mdx | Upload protocol | Miner | base (upload protocol) |
| reference/weights-schema | reference/weights-schema.mdx | Weights schema | Validator | base (weight-setting) |

## Tab: Architecture
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| architecture/overview | architecture/overview.mdx | Architecture overview | Operator/infra | base |
| architecture/master | architecture/master.mdx | Master node | Operator/infra | base (master) |
| architecture/validator-network | architecture/validator-network.mdx | Validator network | Operator/infra | base (validator) |
| architecture/challenge-integration | architecture/challenge-integration.mdx | Challenge integration | Agent dev | base, agent-challenge, prism |
| architecture/swarm | architecture/swarm.mdx | Swarm / miner pool | Operator/infra | base (miner/swarm) |
| architecture/broker | architecture/broker.mdx | Broker | Operator/infra | base (broker) |
| architecture/supervisor | architecture/supervisor.mdx | Supervisor | Operator/infra | base (supervisor) |
| architecture/weights-pipeline | architecture/weights-pipeline.mdx | Weights pipeline | Operator/infra | base (weight-setting) |
| architecture/security | architecture/security.mdx | Security model | Operator/infra | base (validator/auth) |
| architecture/database | architecture/database.mdx | Database & registry | Operator/infra | base (db/registry) |

## Tab: Challenges
| Slug | File | Title | Audience | Source repo |
|------|------|-------|----------|-------------|
| challenges/overview | challenges/overview.mdx | Challenges on BASE | All | base, SOURCES.md |
| challenges/agent-challenge | challenges/agent-challenge.mdx | Agent Challenge | Agent dev | agent-challenge |
| challenges/prism | challenges/prism.mdx | PRISM Challenge | PRISM user | prism |
| challenges/bounty-challenge | challenges/bounty-challenge.mdx | Bounty Challenge | Agent dev | bounty-challenge (secondary/stub) |
| challenges/data-fabrication | challenges/data-fabrication.mdx | Data Fabrication Challenge | Agent dev | data-fabrication (secondary/stub) |
| challenges/agent-swe | challenges/agent-swe.mdx | Agent SWE Challenge | Agent dev | Agent-SWE (secondary/stub) |
| challenges/creating | challenges/creating.mdx | Creating a challenge | Agent dev | base (challenge integration) |
| challenges/sdk | challenges/sdk.mdx | Challenge SDK | Agent dev | base, agent-challenge |

---

## Summary
- **8 tabs**, **23 groups**, **81 page slugs** total (verified 1:1 against `docs.json`, zero duplicates).
- Reused existing starter pages: `index`, `quickstart`.
- Primary challenges: **agent-challenge**, **prism**. Secondary/stub challenges
  (under "Additional challenges"): bounty-challenge, data-fabrication, Agent-SWE.
- Canonical source repo on all conflicts: **base** (netuid 100).
