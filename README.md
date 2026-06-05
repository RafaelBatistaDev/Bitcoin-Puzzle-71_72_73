# Bitcoin + Ethereum + Solana + BNB + Polygon Puzzle Solver v4.0 - High-Performance Modular Architecture

# Chaves de API
https://www.ankr.com/rpc

# criar e entrar no toolbox
toolbox create puzzle-solver
toolbox enter puzzle-solver

# Executar baixar dependençias
./setup_toolbox.sh

# QuickStart
./quickstart.sh

## 🎯 Rodar Solvers

### **OPÇÃO 1: Rodar todos os 5 networks (Todos os Puzzles 71, 72, 73 em paralelo)**
```bash
./run_all_networks_all_puzzles.sh
```
✅ Executa Bitcoin + Ethereum + Solana + Polygon + BNB  
✅ 15 puzzles (3×5) rodando ao mesmo tempo  
✅ Gera `batch_history.jsonl` em cada `PUZZLE_*`  
⏱️ Tempo: ~1-2 horas (depende da velocidade do RPC e CPU)

---

### **OPÇÃO 2: Rodar todos os 5 networks em paralelo (Puzzles Específicos)**
Para rodar apenas um puzzle específico em todas as 5 redes simultaneamente:

#### Rodar apenas o Puzzle 71 nas 5 redes
```bash
./run_all_networks_puzzle71.sh
```

#### Rodar apenas o Puzzle 72 nas 5 redes
```bash
./run_all_networks_puzzle72.sh
```

#### Rodar apenas o Puzzle 73 nas 5 redes
```bash
./run_all_networks_puzzle73.sh
```

---

## ✅ Verificar Resultados

### **OPÇÃO 1: Verificar todos os 5 networks (RECOMENDADO)**
```bash
uv run check_all_networks.py
```
✅ Extrai endereços com saldo dos 5 networks  
✅ Gera 5 arquivos individuais + 1 consolidado  
✅ Output: `relatorio_final/`



# rodar scripts de procura 

# all bitcoin
./run_all_puzzles.sh

# Bitcoin + Ethereum paralelo
./run_dual_mode.sh

# Bitcoin + Ethereum + Solana - paralelo
./run_triple_mode.sh

# all bitoin verificar se encotrou
uv run check_bitcoin.py

# all ethereum verificar se encotrou
uv run check_ethereum.py

# all ethereum verificar se encotrou
uv run check_solana.py

# Bitcoin apenas
PUZZLE_ID=72 node ./puzzle_solver.js

# Ethereum apenas
PUZZLE_ID=72 node puzzle_solver_ethereum.js

# all bitoin verificar se encotrou
uv run check_bitcoin.py

# all ethereum verificar se encotrou
uv run check_ethereum.py

# checar balanco dos que foram encontrados
./check_balance.sh

# instalar dependençias
./setup_toolbox.sh

# Bitcoin apenas
PUZZLE_ID=72 node puzzle_solver.js

# Ethereum apenas
PUZZLE_ID=72 node puzzle_solver_ethereum.js

# Todos os puzzles Bitcoin
./run_all_puzzles.sh

# Bitcoin + Ethereum paralelo
./run_dual_mode.sh

# Executar all Bitcoin
chmod +x run_all_puzzles.sh && ./run_all_puzzles.sh

# executar all ethereum
chmod +x run_all_puzzles_ethereum.sh && ./run_all_puzzles_ethereum.sh

Fully restructured with **centralized balance verification**, environment configuration support, and high-performance validators. All outputs are created within their respective folders.

## 📁 Complete Structure

```
2--71-72-73/
├── config.js                     # ⭐ Centralized configuration loader (.env support)
├── puzzle_solver.js              # ⭐ Bitcoin solver entry point
├── puzzle_solver_ethereum.js     # Ethereum solver entry point
├── puzzle_solver_solana.js       # Solana solver entry point
├── puzzle_solver_polygon.js      # Polygon solver entry point
├── puzzle_solver_bnb.js          # BNB solver entry point
│
├── bitcoin/                      # Bitcoin modular project
│   ├── cache/                    # Bitcoin state files (puzzle_71.json, etc.)
│   ├── PUZZLE_71, 72, 73/        # Checked addresses log folders
│   ├── config/                   # Solver configuration, main solver & balance verifier
│   └── reports/                  # Standalone checkers report output
│
├── ethereum/                     # Ethereum modular project
│   ├── cache/                    # Ethereum state files
│   ├── PUZZLE_71, 72, 73/        # Checked addresses log folders
│   ├── config/                   # Solver config, main solver & balance verifier
│   └── reports/
│
├── solana/                       # Solana modular project
│   ├── cache/                    # Solana state files
│   ├── PUZZLE_71, 72, 73/        # Checked addresses log folders
│   ├── config/                   # Solver config, main solver & balance verifier
│   └── reports/
│
├── polygon/                      # Polygon modular project ⭐
│   ├── cache/                    # Polygon state files
│   ├── PUZZLE_71, 72, 73/        # Checked addresses log folders
│   ├── config/                   # Solver config, main solver & balance verifier
│   └── reports/
│
├── bnb/                          # BNB modular project ⭐
│   ├── cache/                    # BNB state files
│   ├── PUZZLE_71, 72, 73/        # Checked addresses log folders
│   ├── config/                   # Solver config, main solver & balance verifier
│   └── reports/
│
├── relatorio_final/              # ⭐ Consolidated results
│   ├── bitcoin_addresses_with_balance.jsonl
│   ├── ethereum_addresses_with_balance.jsonl
│   ├── solana_addresses_with_balance.jsonl
│   ├── polygon_addresses_with_balance.jsonl ⭐
│   ├── bnb_addresses_with_balance.jsonl ⭐
│   ├── saldos_encontrados.jsonl  # Solvers found balances output
│   └── all_networks_consolidated.jsonl 🚀 # Consolidated python checking output
```
├── puzzle_solver.js              # ⭐ Bitcoin validator (Blockbook/Ankr - high performance)
├── puzzle_solver_ethereum.js     # Ethereum entry point
├── puzzle_solver_solana.js       # Solana entry point
├── puzzle_solver_polygon.js      # Polygon entry point
├── puzzle_solver_bnb.js          # BNB entry point
├── .env                          # ⭐ Configuration (variables for all scripts)
├── .env.example                  # Configuration template
├── run_all_puzzles.sh            # Run Bitcoin puzzles 71-73 parallel
├── run_all_puzzles_ethereum.sh   # Run Ethereum puzzles 71-73 parallel
├── run_all_puzzles_solana.sh     # Run Solana puzzles 71-73 parallel
├── run_all_puzzles_polygon.sh    # Run Polygon puzzles 71-73 parallel
├── run_all_puzzles_bnb.sh        # Run BNB puzzles 71-73 parallel
├── run_all_networks_all_puzzles.sh # MASTER: Todos os 5 networks / Todos os Puzzles 71,72,73 🚀
├── run_all_networks_puzzle71.sh  # Executa Puzzle 71 em todas as 5 redes 🚀
├── run_all_networks_puzzle72.sh  # Executa Puzzle 72 em todas as 5 redes 🚀
├── run_all_networks_puzzle73.sh  # Executa Puzzle 73 em todas as 5 redes 🚀
├── run_dual_mode.sh              # Run Bitcoin + Ethereum simultaneously
├── setup_toolbox.sh              # Install Node.js dependencies
├── check_balance.sh              # Consolidated balance verification
├── verify_all_balances.py        # Python balance analyzer
├── package.json                  # Dependencies
└── README.md                     # This file
```

## 🚀 Quick Start

### 1. Setup Dependencies
```bash
npm install
npm install web3-utils
# or
bash setup_toolbox.sh
```

### 2. Configure Environment Variables
```bash
# Copy template
cp .env.example .env

# Edit .env with your settings
nano .env  # or your preferred editor
```

**Essential .env variables:**
```env
# Puzzle to solve (71, 72, or 73)
PUZZLE_ID=72

# Batch size for address verification
BATCH_SIZE=100

# Bitcoin Blockbook/Ankr URL (for high-performance validator)
ANKR_BTC_BLOCKBOOK_URL=https://rpc.ankr.com/blockbook_btc/YOUR_API_KEY

# Search mode: random or sequential
SEARCH_MODE=random
```

### 3. Run Bitcoin Solver

**Using .env (loads automatically):**
```bash
node puzzle_solver.js                  # High-perf Blockbook validator
node --env-file=.env puzzle_solver.js  # Explicit .env loading
```

**Using PUZZLE_ID override:**
```bash
PUZZLE_ID=71 node puzzle_solver.js
PUZZLE_ID=72 node puzzle_solver.js
PUZZLE_ID=73 node puzzle_solver.js
```

**All 3 puzzles in parallel:**
```bash
./run_all_puzzles.sh
```

### 4. Verify Balances

**Check found addresses:**
```bash
./check_balance.sh                  # Consolidated verification
cat relatorio_final/saldos_encontrados.jsonl  # View all found balances
```

### 5. View Results
```bash
# Bitcoin batch history
cat bitcoin/PUZZLE_72/batch_history.jsonl | wc -l  # Count checked addresses

# Consolidated report
cat relatorio_final/saldos_encontrados.jsonl | jq .  # View all findings
```





## 🔧 Configuration (.env)

### Environment Variables Priority
Configuration is loaded in this order:
1. **Environment variables** (`export PUZZLE_ID=71`)
2. **.env file** variables (recommended)
3. **Hardcoded defaults** in `config.js`

### Available Variables

```env
# -------- PUZZLE SOLVER --------
PUZZLE_ID=72                     # Puzzle to solve (71, 72, or 73)
BATCH_SIZE=100                   # Addresses per batch
DELAY_MS=20000                   # Milliseconds between batches
TIMEOUT_MS=10000                 # Request timeout (ms)
SEARCH_MODE=random               # Search mode: random or sequential

# -------- BLOCKBOOK / ANKR --------
ANKR_BTC_BLOCKBOOK_URL=...      # Bitcoin Blockbook URL (high-perf validator)
BLOCKBOOK_DELAY_MS=300           # Blockbook batch delay (ms)
BLOCKBOOK_TIMEOUT_MS=10000       # Blockbook timeout (ms)
```

### Example Configurations

**High-speed Bitcoin verification (Blockbook):**
```bash
ANKR_BTC_BLOCKBOOK_URL=https://rpc.ankr.com/blockbook_btc/YOUR_KEY
BLOCKBOOK_DELAY_MS=200
BLOCKBOOK_TIMEOUT_MS=5000
```

**Conservative settings (API-friendly):**
```bash
BATCH_SIZE=50
DELAY_MS=30000
BLOCKBOOK_DELAY_MS=500
```

**Random vs Sequential search:**
```bash
# Random (Monte Carlo) - faster but non-deterministic
SEARCH_MODE=random

# Sequential - deterministic, resumes from last position
SEARCH_MODE=sequential
```

## 📊 Output Locations

### Consolidated Results (All Blockchains)
- **Found Balances**: `relatorio_final/saldos_encontrados.jsonl` (unified output)
  - Format: JSON-Lines (one JSON object per found address)
  - Includes: coin, puzzle, address, balance, privkey, timestamp

### Bitcoin Results
- **State**: `bitcoin/cache/puzzle_71.json`, `puzzle_72.json`, `puzzle_73.json`
- **Batch History**: `bitcoin/PUZZLE_71/batch_history.jsonl` (all checked addresses)
- **Solutions**: `bitcoin/PUZZLE_71/FOUND_<address>.txt` (if found)
- **Reports**: `bitcoin/reports/balance_check_*.jsonl`

### Ethereum Results
- **State**: `ethereum/cache/puzzle_71.json`, `puzzle_72.json`, `puzzle_73.json`
- **Candidates**: `ethereum/candidates/puzzle_71/`, etc.
- **Batch History**: `ethereum/PUZZLE_71/batch_history.jsonl` (all checked addresses)
- **Solutions**: `ethereum/PUZZLE_71/FOUND_<address>.txt` (if found)
- **Reports**: `ethereum/reports/balance_check_*.jsonl`

## 🔍 Analyze Results

### View Consolidated Findings
```bash
# All found balances across Bitcoin + Ethereum
cat relatorio_final/saldos_encontrados.jsonl

# Pretty print
cat relatorio_final/saldos_encontrados.jsonl | jq .

# Count total findings
cat relatorio_final/saldos_encontrados.jsonl | wc -l
```

### Analyze Bitcoin Batch History
```bash
# Count total checked addresses
cat bitcoin/PUZZLE_72/batch_history.jsonl | wc -l

# Find addresses with non-zero balance
cat bitcoin/PUZZLE_72/batch_history.jsonl | jq 'select(.balance > 0)'

# Export found addresses to file
cat bitcoin/PUZZLE_72/batch_history.jsonl | jq -r 'select(.balance > 0) | .address' > found_addresses.txt
```

### Python Analysis
```bash
# Comprehensive verification
uv run verify_all_balances.py

# Or use the shell script
./check_balance.sh
```

## 🔐 Core Modules

### Centralized Config (`./config.js`)
* **loadEnvFile & initializeConfig**: Parses the root `.env` file and populates `process.env` safely.
* **Cascading priority**: Checks command-line flags first, then `.env`, and finally defaults.
* **Strict Validation**: Validates addresses format (EIP-55 for EVM, Base58 for Solana/Bitcoin), API endpoint URLs, integer boundaries, and throws clear start-time errors.

### Bitcoin (`bitcoin/`)
* **config/config.js**: Loads custom Bitcoin runtime constants (ranges, Blockbook endpoints).
* **config/balance_verifier.js**: Queries BTC address balance using Ankr Blockbook API.
* **config/utils.js**: `CryptoEngine` handles ECDSA secp256k1 key pair math and generates WIF, compressed/uncompressed public keys, and BIP44, BIP49, BIP84, BIP86 address formats.
* **config/solver.js**: Manages sequential/random search loops, saving intermediate state dynamically.

### Ethereum (`ethereum/`)
* **config/config.js**: Ethereum constants and Ankr JSON-RPC API parameters.
* **config/balance_verifier.js**: Uses Web3 JSON-RPC batching (`eth_getBalance`) for maximum performance.
* **config/utils.js**: Converts private keys directly to Keccak256 checksummed Ethereum EIP-55 addresses.
* **config/solver.js**: Orchestrates search candidates generation and verification loops.

### Solana (`solana/`)
* **config/config.js**: Loads custom Solana variables and targets.
* **config/balance_verifier.js**: Performs high-speed RPC `getBalance` batch queries.
* **config/utils.js**: Uses native `ed25519` key derivation to map private keys to Solana Base58 addresses.
* **config/solver.js**: High-performance solver loop that respects Helius RPC rate limit thresholds.

### Polygon (`polygon/`)
* **config/config.js**: Loads Polygon targets (MATIC) and dRPC nodes parameters.
* **config/balance_verifier.js**: Optimized JSON-RPC balancer interface using dRPC load-balancers.
* **config/utils.js**: EVM candidate address generation with secure secp256k1 derivation.
* **config/solver.js**: High-performance solver loop for Polygon network.

### BNB Chain (`bnb/`)
* **config/config.js**: Configuration loader for BNB Chain (BSC) targets.
* **config/balance_verifier.js**: Connects with official BSC nodes and utilizes BscScan checker fallbacks.
* **config/utils.js**: Derived EVM address verification matching BSC mainnet checksum standards.
* **config/solver.js**: High-performance solver loop for BNB Chain.

### Main Validators & Solvers
* **puzzle_solver.js**: High-performance Bitcoin validator with native Fetch API, Blockbook integration, and support for 5 BIP formats simultaneously.
* **puzzle_solver_ethereum.js**: Bootstrapper for Ethereum.
* **puzzle_solver_solana.js**: Bootstrapper for Solana (includes bigint-buffer monkeypatching).
* **puzzle_solver_polygon.js**: Bootstrapper for Polygon.
* **puzzle_solver_bnb.js**: Bootstrapper for BNB Chain.

## 🏗️ Architecture Overview

```
┌────────────────────────────────────────────────────────────────────────┐
│                        .env Configuration                              │
│ (PUZZLE_ID, BATCH_SIZE, RPC endpoints, delays, API keys, SEARCH_MODE)  │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
                                    ▼
       ┌──────────────────────────────────────────────────────────┐
       │             ./config.js (loadEnv & Validation)           │
       │  Validates format and makes settings global/process.env   │
       └────────────────────────────┬─────────────────────────────┘
                                    │
       ┌────────────────────────────┼────────────────────────────┐
       ▼                            ▼                            ▼
┌──────────────┐             ┌──────────────┐             ┌──────────────┐
│  Bitcoin     │             │  Ethereum/EVM│             │  Solana      │
│  Solver/Entry│             │  Solvers     │             │  Solver/Entry│
│  (Ankr/Block)│             │  (Ankr RPC)  │             │  (Helius RPC)│
└──────┬───────┘             └──────┬───────┘             └──────┬───────┘
       │                            │                            │
       └────────────────────────────┼────────────────────────────┘
                                    │
                                    ▼
       ┌──────────────────────────────────────────────────────────┐
       │             Centralized balance_verifier.js              │
       │       Validates balances for generated keys locally       │
       └────────────────────────────┬─────────────────────────────┘
                                    │
                                    ▼
       ┌──────────────────────────────────────────────────────────┐
       │           relatorio_final/saldos_encontrados.jsonl       │
       │               (Unified output - all findings)            │
       └──────────────────────────────────────────────────────────┘
```

## 📦 Dependencies

```json
{
  "elliptic": "^6.6.1",      // ECDSA secp256k1
  "bs58": "^6.0.0",          // Bitcoin Base58 encoding
  "axios": "^1.7.9",         // HTTP requests
  "web3-utils": "^4.x",      // Keccak256 for Ethereum
  "sha3": "^2.1.4"           // Hash functions
}
```

## ✅ Features

- ✓ **Modular architecture** - 5 networks (bitcoin, ethereum, solana, polygon, bnb) completely isolated
- ✓ **Centralized balance verification** - reusable `balance_verifier.js` modules
- ✓ ⭐ **.env support** - single configuration file for all scripts
- ✓ ⭐ **High-performance validator** - `puzzle_solver.js` with Blockbook/Ankr
- ✓ **Native Fetch API** - Node.js v18+ (no axios overhead)
- ✓ **Configurable search** - sequential (deterministic) or random (Monte Carlo)
- ✓ **Batch optimization** - efficient API usage with configurable delays
- ✓ **Rate limiting** - automatic retry on 429 errors
- ✓ **State persistence** - resume from last position after crash
- ✓ **Parallel execution** - 7s offset between puzzles to avoid API overload
- ✓ **Multichain execution** - run all 5 networks in parallel
- ✓ **Unified output** - `relatorio_final/saldos_encontrados.jsonl` consolidates all findings
- ✓ **Alert system** - visual and audio alerts when balance found
- ✓ **Keccak256 correct** - web3-utils for proper Ethereum address derivation
- ✓ **EIP-55 checksum** - proper Ethereum address case sensitivity
- ✓ **5 BIP formats** - Bitcoin support for BIP44, BIP49, BIP84, BIP86

## 🎯 Puzzles & Targets

### Puzzle 71
* **Range**: `2^66` to `2^67`
* **Bitcoin target**: `1PWo3JeB9jrGwfHDNpdGK54CRas7fsVzXU`
* **Ethereum / Polygon / BNB target**: `0x00000000219ab540356cBB839Cbe05303d7705Fa`
* **Solana target**: `4ZJhPQAgUseCsWhKvJLTmmRRUV74fdoTpQLNfKoekbPY`

### Puzzle 72
* **Range**: `2^67` to `2^68`
* **Bitcoin target**: `1JTK7s9YVYywfm5XUH7RNhHJH1LshCaRFR`
* **Ethereum / Polygon / BNB target**: `0xBE0eB53F46cd790Cd13851d5EFf43D12404d33E8`
* **Solana target**: `9WzDXwBbmkg8ZTbNMqUxvQRAyrZzDsGYdLVL9zYtAWWM`

### Puzzle 73
* **Range**: `2^68` to `2^69`
* **Bitcoin target**: `12VVRNPi4SJqUTsp6FmqDqY5sGosDtysn4`
* **Ethereum / Polygon / BNB target**: `0x40B38765696e3d5d8d9d834D8AaD4bB6e418E489`
* **Solana target**: `7mhcgF1DVsj5iv4CxZDgp51H6MBBwqamsH1KnqXhSRc5`

## 📝 Notes

- All files are created within their respective network folders (e.g., `bitcoin/`, `ethereum/`, `solana/`, `polygon/`, `bnb/`)
- No files are created in the root directory during execution
- State files allow resuming from the last checked position
- Logs are created in real-time for monitoring progress
- Batch history is appended JSONL format (one JSON object per line)

## 🆕 What's New in v4.0

### Centralized Balance Verification
- New `balance_verifier.js` modules in all five network directories
- Reutilizable across solvers and balance_checkers
- Automatic consolidation to `relatorio_final/saldos_encontrados.jsonl`
- Unified alert system with visual and audio feedback

### Environment Configuration (.env)
- Single `.env` file configures all scripts
- Cascading priority: env vars > .env > defaults
- No need to modify code to change settings
- `.env.example` template included for reference
- Centralized verification prevents command-line environment overrides from being ignored

### High-Performance Multi-Network Solvers
- New dedicated bootstrappers `puzzle_solver_solana.js`, `puzzle_solver_polygon.js`, and `puzzle_solver_bnb.js`
- Custom RPC wrappers for Blockbook, Ankr, Helius, and dRPC load balancers
- Automatic rate limit handling (429 retry with backoff)
- Support for 5 Bitcoin BIP formats simultaneously (BIP44, BIP49, BIP84, BIP86)

### Architecture & Scripting Improvements
- Clean delegation pattern between modules
- Parallelization scripts for individual puzzle IDs (`run_all_networks_puzzle71.sh`, etc.) and all puzzles consolidated (`run_all_networks_all_puzzles.sh`)
- Modular, testable components
- Better error handling and structured logging
- Unified output formats for all findings across all 5 networks

### Summary of Changes
| Component | v3.0 | v4.0 |
|-----------|------|------|
| Config | Hardcoded | .env file + cascading |
| Balance Check | Scattered | Centralized verifier |
| Bitcoin API | blockchain.info | blockchain.info + Blockbook |
| Output | Per-folder | relatorio_final/saldos_encontrados.jsonl |
| Alert System | Basic | Enhanced with timing + persistence |
