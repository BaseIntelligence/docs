# NAV-SLUG-MAP — BASE docs (IA: validators + miners-per-challenge)

Binding contract between `docs.json` navigation and `.mdx` paths.

Audience legend: **All** · **Miner** · **Validator** · **Challenge operator** · **Integrator**

## Tab: Overview

|Slug|File|Title|Audience|
|---|---|---|---|
| index | index.mdx | Welcome to BASE | All |
| concepts/overview | concepts/overview.mdx | What is BASE? | All |
| concepts/how-it-works | concepts/how-it-works.mdx | How the subnet works | All |
| concepts/challenges | concepts/challenges.mdx | Challenges explained | All |
| concepts/miners-and-validators | concepts/miners-and-validators.mdx | Miners and validators | All |
| concepts/weights-and-emissions | concepts/weights-and-emissions.mdx | Weights and emissions | All |
| concepts/incentive-mechanism | concepts/incentive-mechanism.mdx | Incentive mechanism | All |
| concepts/glossary | concepts/glossary.mdx | Glossary | All |
| quickstart | quickstart.mdx | Quickstart (operators and developers) | Validator / All |
| concepts/installation | concepts/installation.mdx | Installation | All |
| concepts/wallets-and-registration | concepts/wallets-and-registration.mdx | Wallets and registration | All |

## Tab: Validators

|Slug|File|Title|Audience|
|---|---|---|---|
| validators/* | validators/*.mdx | BASE operator pack | Validator |

## Tab: Challenges

|Slug|File|Title|Audience|
|---|---|---|---|
| challenges/overview | challenges/overview.mdx | Challenges on BASE | All / Miner |
| challenges/agent-challenge/* | challenges/agent-challenge/*.mdx | Agent Challenge full miner pack | Miner |
| challenges/prism/* | challenges/prism/*.mdx | PRISM full miner pack | Miner + challenge operator |
| challenges/bounty-challenge | challenges/bounty-challenge.mdx | Bounty | Miner |
| challenges/data-fabrication | challenges/data-fabrication.mdx | Data Fabrication | Miner |
| challenges/agent-swe | challenges/agent-swe.mdx | Agent SWE | Miner |
| challenges/creating | challenges/creating.mdx | Creating a challenge | Author |
| challenges/sdk | challenges/sdk.mdx | Challenge SDK | Author |

Hub stubs (not in primary nav, keep for old URLs):

- `challenges/agent-challenge.mdx` → pack index
- `challenges/prism.mdx` → pack overview

## Tab: Miner hub

|Slug|File|Title|Audience|
|---|---|---|---|
| miners/overview | miners/overview.mdx | Miner hub | Miner |
| miners/quickstart | miners/quickstart.mdx | Miner quickstart | Miner |
| miners/wallet-registration | miners/wallet-registration.mdx | Wallet and registration | Miner |
| miners/choose-a-challenge | miners/choose-a-challenge.mdx | Choosing a challenge | Miner |
| miners/authentication | miners/authentication.mdx | Authentication | Miner |
| miners/submitting | miners/submitting.mdx | Submitting (generic) | Miner |
| miners/installation | miners/installation.mdx | Installation | Miner |
| miners/monitoring | miners/monitoring.mdx | Monitoring | Miner |
| miners/troubleshooting | miners/troubleshooting.mdx | Troubleshooting | Miner |
| miners/migration-baseagent | miners/migration-baseagent.mdx | Migrating from baseagent | Miner |

## Legacy stubs (not primary tabs)

- `agents/*` → `challenges/agent-challenge/*`
- `prism/*` → `challenges/prism/*`

## Tab: Reference and Architecture

Unchanged path set under `reference/*` and `architecture/*`.

## Product truth

1. BASE docs for operators = validators / subnet infra only
2. Miners compete inside challenges; no undirected Base mining game
3. Agent Challenge production = Phala TDX self-deploy, RA-TLS key release, no Base LLM gateway on scored path
