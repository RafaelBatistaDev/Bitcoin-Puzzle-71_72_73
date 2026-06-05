# Bitcoin + Ethereum Puzzle Solver v4.0 - High-Performance Modular Architecture

# Chaves de API
https://www.ankr.com/rpc

# criar e entrar no toolbox
toolbox create puzzle-solver
toolbox enter puzzle-solver

# Executar baixar dependençias
./setup_toolbox.sh

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
├── bitcoin/
│   ├── cache/                    # Bitcoin state files (puzzle_71.json, etc.)
│   ├── PUZZLE_71/                # Puzzle 71 results
│   │   └── batch_history.jsonl   # All checked addresses (JSON-L format)
│   ├── PUZZLE_72/                # Puzzle 72 results
│   │   └── batch_history.jsonl
│   ├── PUZZLE_73/                # Puzzle 73 results
│   │   └── batch_history.jsonl
│   ├── reports/                  # Analysis reports
│   ├── config.js                 # Configuration loader (.env support)
│   ├── balance_verifier.js       # ⭐ Centralized balance verifier (reutilizável)
│   ├── utils.js                  # CryptoEngine (ECDSA, SHA256, Base58Check)
│   ├── solver.js                 # Main solver (uses balance_verifier)
│   └── balance_checker.js        # Standalone balance checker
│
├── ethereum/
│   ├── cache/                    # Ethereum state files
│   ├── candidates/               # Ethereum candidate addresses
│   ├── PUZZLE_71/                # Puzzle 71 results
│   │   └── batch_history.jsonl
│   ├── PUZZLE_72/                # Puzzle 72 results
│   │   └── batch_history.jsonl
│   ├── PUZZLE_73/                # Puzzle 73 results
│   │   └── batch_history.jsonl
│   ├── reports/                  # Analysis reports
│   ├── config.js                 # Configuration loader (.env support)
│   ├── balance_verifier.js       # ⭐ Centralized balance verifier (reutilizável)
│   ├── utils.js                  # CryptoEngine (ECDSA, Keccak256, EIP-55)
│   ├── solver.js                 # Main solver (uses balance_verifier)
│   └── balance_checker.js        # Standalone balance checker
│
├── relatorio_final/              # ⭐ Consolidated results
│   └── saldos_encontrados.jsonl  # All found balances (unified output)
│
├── puzzle_solver.js              # ⭐ Bitcoin validator (Blockbook/Ankr - high performance)
├── puzze_solver_ethereum.js      # Ethereum entry point
├── .env                          # ⭐ Configuration (variables for all scripts)
├── .env.example                  # Configuration template
├── run_all_puzzles.sh            # Run Bitcoin puzzles 71-73 parallel
├── run_all_puzzles_ethereum.sh   # Run Ethereum puzzles 71-73 parallel
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

### Bitcoin (`bitcoin/`)
- **config.js** ⭐ NEW: Loads `.env` and exports `RUNTIME_CONFIG` + `BLOCKBOOK_CONFIG`
  - Puzzle definitions, range limits (2^66 to 2^132)
  - `.env` support with cascading priority
  - BLOCKBOOK configuration for Ankr integration
  
- **balance_verifier.js** ⭐ NEW: Centralized balance verification
  - Method: `verifyBalances(addresses, puzzleId)`
  - Automatic alert on balance > 0
  - Saves to consolidated `relatorio_final/saldos_encontrados.jsonl`
  - Reutilizable by solver, balance_checker, and other modules

- **utils.js**: CryptoEngine class
  - `privkeyToAddress()` - ECDSA → SHA256 → RIPEMD160 → Base58Check
  - `privkeyToWif()` - Wallet import format
  - `generateRandomPrivkey()` - Range-bounded random generation
  - `validatePrivkeyRange()` - Range validation
  
- **solver.js**: BitcoinSolver class (refactored to use balance_verifier)
  - Batch processing (configurable via .env BATCH_SIZE)
  - Uses centralized balance verification
  - State persistence (resume capability)
  - SIGINT handling (graceful shutdown)

- **balance_checker.js**: Standalone balance verification
  - Can run independently of solver
  - Uses same centralized balance_verifier
  - Reports saved to `bitcoin/reports/`

### Ethereum (`ethereum/`)
- **config.js**: Loads `.env` and exports `RUNTIME_CONFIG`
  - Puzzle definitions, range limits
  - `.env` support with cascading priority
  - Ankr RPC endpoint configuration

- **balance_verifier.js** ⭐ NEW: Centralized balance verification (Ethereum version)
  - Method: `verifyBalances(addresses, puzzleId)`
  - JSON-RPC batch support (10 addresses per batch)
  - Automatic alert on balance > 0
  - Saves to consolidated output

- **utils.js**: CryptoEngine class
  - `privkeyToAddress()` - ECDSA → Keccak256 → last 20 bytes → EIP-55 checksum
  - `toChecksumAddress()` - EIP-55 checksum encoding
  - `isValidAddress()` - Format validation
  - `generateRandomPrivkey()` - Range-bounded random generation
  - `validatePrivkeyRange()` - Range validation
  
- **solver.js**: EthereumSolver class (refactored to use balance_verifier)
  - Batch processing (configurable via .env BATCH_SIZE)
  - Uses centralized balance verification
  - State persistence (resume capability)
  - SIGINT handling (graceful shutdown)

- **balance_checker.js**: Standalone balance verification
  - Can run independently of solver
  - Uses same centralized balance_verifier

### Main Validators
- **puzzle_solver.js** ⭐ NEW: High-performance Bitcoin validator
  - Uses native Node.js Fetch API (v18+)
  - Blockbook/Ankr integration for Bitcoin
  - Rate limiting with automatic retry (429 handling)
  - Supports 5 BIP formats simultaneously
  - Clean, minimal implementation for high throughput

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────┐
│              .env Configuration                 │
│  (PUZZLE_ID, BATCH_SIZE, BLOCKBOOK_URL, etc)   │
└────────────────────┬────────────────────────────┘
                     │
                     ▼
    ┌───────────────────────────────────────────┐
    │      bitcoin/config.js (loadEnv)          │
    │      ethereum/config.js (loadEnv)         │
    │  Exports: RUNTIME_CONFIG, BLOCKBOOK_CONFIG│
    └────────────┬────────────────────────────┬─┘
                 │                            │
         ┌───────▼────────┐            ┌──────▼──────┐
         │  puzzle_        │            │  Solvers    │
         │  solver.js      │            │  (Fetch)    │
         │  (Blockbook)    │            │             │
         └────────┬────────┘            └──────┬──────┘
                  │                           │
                  └───────────┬────────────────┘
                              │
                              ▼
              ┌──────────────────────────────────┐
              │  balance_verifier.js              │
              │  (Bitcoin + Ethereum)             │
              │  Centralized validation           │
              └──────────────────┬───────────────┘
                                 │
                                 ▼
                  ┌──────────────────────────────────┐
                  │ relatorio_final/saldos_          │
                  │ encontrados.jsonl                │
                  │ (Unified output - all findings)  │
                  └──────────────────────────────────┘
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

- ✓ **Modular architecture** - bitcoin/ and ethereum/ completely isolated
- ✓ **Centralized balance verification** - reusable `balance_verifier.js` modules
- ✓ ⭐ **.env support** - single configuration file for all scripts
- ✓ ⭐ **High-performance validator** - `puzzle_solver.js` with Blockbook/Ankr
- ✓ **Native Fetch API** - Node.js v18+ (no axios overhead)
- ✓ **Configurable search** - sequential (deterministic) or random (Monte Carlo)
- ✓ **Batch optimization** - efficient API usage with configurable delays
- ✓ **Rate limiting** - automatic retry on 429 errors
- ✓ **State persistence** - resume from last position after crash
- ✓ **Parallel execution** - 7s offset between puzzles to avoid API overload
- ✓ **Dual blockchain** - run Bitcoin and Ethereum simultaneously
- ✓ **Unified output** - `relatorio_final/saldos_encontrados.jsonl` consolidates all findings
- ✓ **Alert system** - visual and audio alerts when balance found
- ✓ **Keccak256 correct** - web3-utils for proper Ethereum address derivation
- ✓ **EIP-55 checksum** - proper Ethereum address case sensitivity
- ✓ **5 BIP formats** - Bitcoin support for BIP44, BIP49, BIP84, BIP86

## 🎯 Puzzles

### Puzzle 71
- **Bitcoin**: `1PWo3JeB9jrGwfHDNpdGK54CRas7fsVzXU`
- **Ethereum**: `0x00000000219ab540356cBB839Cbe05303d7705Fa`
- **Range**: 2^66 to 2^67

### Puzzle 72
- **Bitcoin**: `1JTK7s9YVYywfm5XUH7RNhHJH1LshCaRFR`
- **Ethereum**: `0xBE0eB53F46cd790Cd13851d5EFf43D12404d33E8`
- **Range**: 2^67 to 2^68

### Puzzle 73
- **Bitcoin**: `12VVRNPi4SJqUTsp6FmqDqY5sGosDtysn4`
- **Ethereum**: `0x40B38765696e3d5d8d9d834D8AaD4bB6e418E489`
- **Range**: 2^68 to 2^69

## 📝 Notes

- All files are created within their respective `bitcoin/` and `ethereum/` folders
- No files are created in the root directory during execution
- State files allow resuming from the last checked position
- Logs are created in real-time for monitoring progress
- Batch history is appended JSONL format (one JSON object per line)

## 🆕 What's New in v4.0

### Centralized Balance Verification
- New `balance_verifier.js` modules in both bitcoin/ and ethereum/
- Reutilizable across solvers and balance_checkers
- Automatic consolidation to `relatorio_final/saldos_encontrados.jsonl`
- Unified alert system with visual and audio feedback

### Environment Configuration (.env)
- Single `.env` file configures all scripts
- Cascading priority: env vars > .env > defaults
- No need to modify code to change settings
- `.env.example` template included for reference

### High-Performance Bitcoin Validator
- New `puzzle_solver.js` with native Fetch API
- Blockbook/Ankr support for Bitcoin verification
- Automatic rate limit handling (429 retry with backoff)
- Support for 5 Bitcoin BIP formats simultaneously (BIP44, BIP49, BIP84, BIP86)

### Architecture Improvements
- Clean delegation pattern between modules
- No code duplication between Bitcoin/Ethereum
- Modular, testable components
- Better error handling and structured logging
- Unified output format for all findings

### Summary of Changes
| Component | v3.0 | v4.0 |
|-----------|------|------|
| Config | Hardcoded | .env file + cascading |
| Balance Check | Scattered | Centralized verifier |
| Bitcoin API | blockchain.info | blockchain.info + Blockbook |
| Output | Per-folder | relatorio_final/saldos_encontrados.jsonl |
| Alert System | Basic | Enhanced with timing + persistence |
