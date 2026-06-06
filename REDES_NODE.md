# 📡 Redes RPC e APIs de Consulta

Este documento detalha as configurações de rede, endpoints RPC e chaves de API utilizadas pelo projeto para a verificação automatizada de saldos dos endereços dos puzzles **71**, **72** e **73** nas redes **Ethereum**, **Solana**, **Polygon**, **BNB Chain** e **Bitcoin**.

As configurações apresentadas abaixo são sincronizadas dinamicamente a partir do arquivo [.env](file:///var/home/recifecrypto/2--71-72-73/.env) e validadas de forma centralizada pelo módulo [config.js](file:///var/home/recifecrypto/2--71-72-73/config.js).

---

## 📊 Visão Geral das Redes

A tabela abaixo resume as configurações de conexão ativa para cada uma das redes suportadas pelo projeto:

| Rede | Tipo de Provedor | Endpoint RPC / API | Variável de Ambiente (`.env`) | Atraso Recomendado (`delay`) | Limite de Req. (24h) |
| :--- | :--- | :--- | :--- | :---: | :---: |
| **Ethereum** | Ankr Multichain | `https://rpc.ankr.com/multichain/...` | `ETH_RPC_ENDPOINT` | 200 ms | 100.000 |
| **Solana** | Helius Free | `https://mainnet.helius-rpc.com/?api-key=...` | `SOL_RPC_ENDPOINT` | 110 ms | 30.000 |
| **Polygon** | dRPC | `https://lb.drpc.org/ogrpc?network=polygon...` | `POLYGON_RPC_ENDPOINT` | 300 ms | 10.000 |
| **BNB Chain** | Binance Dataseed | `https://bsc-dataseed.binance.org` | `BNB_RPC_ENDPOINT` | 200 ms | 100.000 |
| **Bitcoin** | Blockchain.info / Ankr | `https://blockchain.info` / Ankr Blockbook | `BLOCKCHAIN_INFO_BASE_URL` | 2000 ms | 30.000 |

---

## ⚙️ Detalhamento por Rede

### 1. Ethereum (ETH)
*   **Finalidade**: Consulta de transações e saldos para chaves secp256k1 geradas.
*   **Provedor RPC**: [Ankr Multichain API](https://rpc.ankr.com/multichain/)
*   **Endpoints configurados**:
    *   `RPC_ENDPOINT`: `https://rpc.ankr.com/multichain`
    *   `ETH_RPC_ENDPOINT`: `https://rpc.ankr.com/multichain/af6ba3816c496e95bd422a2775ce65ece906e9d4a220ab084d538d01ea0176e6`
*   **Integração do Explorer**: Etherscan API para checagem rápida.
    *   `ETHERSCAN_KEY`: `8GS74KI7YYVW3M5V5WZ4SGJHHU85HA6JTX`
*   **Endereços Alvo (Targets)**:
    *   **Puzzle 71**: `0x00000000219ab540356cBB839Cbe05303d7705Fa`
    *   **Puzzle 72**: `0xBE0eB53F46cd790Cd13851d5EFf43D12404d33E8`
    *   **Puzzle 73**: `0x40B38765696e3d5d8d9d834D8AaD4bB6e418E489`
*   **Controle de Taxa (Rate Limit)**:
    *   Delay entre requisições: `200ms` (`ETH_DELAY_MS`)
    *   Limite diário: `100.000` requisições (`ETH_MAX_REQ_24H`)

---

### 2. Solana (SOL)
*   **Finalidade**: Verificação de endereços derivados e saldos em base58.
*   **Provedor RPC**: [Helius](https://helius.dev/) (Plano Free - Limite estrito de 10 requisições/segundo)
*   **Endpoint configurado**:
    *   `SOL_RPC_ENDPOINT`: `https://mainnet.helius-rpc.com/?api-key=c4127e39-e917-407f-8259-d2e5c6471a7c`
*   **Endereços Alvo (Targets)**:
    *   **Puzzle 71**: `4ZJhPQAgUseCsWhKvJLTmmRRUV74fdoTpQLNfKoekbPY`
    *   **Puzzle 72**: `9WzDXwBbmkg8ZTbNMqUxvQRAyrZzDsGYdLVL9zYtAWWM`
    *   **Puzzle 73**: `7mhcgF1DVsj5iv4CxZDgp51H6MBBwqamsH1KnqXhSRc5`
*   **Controle de Taxa (Rate Limit)**:
    *   Delay sequencial: `110ms` (`SOL_DELAY_MS`), garantindo aproximadamente 9 req/seg para evitar HTTP 429.
    *   Limite diário: `30.000` requisições (`MAX_REQ_24H`), adequado para o limite mensal gratuito de 1 milhão de créditos.

---

### 3. Polygon (POLYGON)
*   **Finalidade**: Verificação de saldos em rede compatível com EVM secundária.
*   **Provedor RPC**: [dRPC](https://drpc.org/)
*   **Endpoints configurados**:
    *   `POLYGON_RPC_ENDPOINT`: `https://lb.drpc.org/ogrpc?network=polygon&dkey=AjCW_JETQkJriSlwdzqDWISeITOjYOwR8Zqu7sA_udJz`
    *   `POLYGON_API_KEY`: `https://lb.drpc.org/ogrpc?network=polygon&dkey=AjCW_JETQkJriSlwdzqDWISeITOjYOwR8Zqu7sA_udJz`
*   **Endereços Alvo (Targets)**:
    *   **Puzzle 71**: `0x00000000219ab540356cBB839Cbe05303d7705Fa`
    *   **Puzzle 72**: `0xBE0eB53F46cd790Cd13851d5EFf43D12404d33E8`
    *   **Puzzle 73**: `0x40B38765696e3d5d8d9d834D8AaD4bB6e418E489`
*   **Controle de Taxa (Rate Limit)**:
    *   Delay entre requisições: `300ms` (`POLYGON_DELAY_MS`)
    *   Atraso Inicial: `100ms` (`POLYGON_INITIAL_DELAY_MS`)
    *   Timeout da requisição: `5000ms` (`POLYGON_TIMEOUT_MS`)

---

### 4. BNB Chain (BNB / BSC)
*   **Finalidade**: Verificação em rede EVM de alta velocidade.
*   **Provedor RPC**: [Binance Dataseed](https://bsc-dataseed.binance.org) (RPC Pública da Binance)
*   **Endpoint configurado**:
    *   `BNB_RPC_ENDPOINT`: `https://bsc-dataseed.binance.org`
*   **Integração do Explorer**: BscScan API.
    *   `BSCSCAN_KEY`: `8GS74KI7YYVW3M5V5WZ4SGJHHU85HA6JTX`
*   **Endereços Alvo (Targets)**:
    *   **Puzzle 71**: `0x00000000219ab540356cBB839Cbe05303d7705Fa`
    *   **Puzzle 72**: `0xBE0eB53F46cd790Cd13851d5EFf43D12404d33E8`
    *   **Puzzle 73**: `0x40B38765696e3d5d8d9d834D8AaD4bB6e418E489`
*   **Controle de Taxa (Rate Limit)**:
    *   Delay entre requisições: `200ms` (`BNB_DELAY_MS`)
    *   Limite diário: `100.000` requisições (`BNB_MAX_REQ_24H`)

---

### 5. Bitcoin (BTC)
*   **Finalidade**: Checagem de endereços de chaves públicas em formato compactado e legados (BIP44/49/84/86).
*   **Provedor de API**: [Blockchain.info API](https://blockchain.info) / [Ankr Blockbook](https://rpc.ankr.com/multichain/)
*   **Configuração**:
    *   API Principal: `https://blockchain.info/balance`
    *   Opcional (Multichain blockbook): `ANKR_BTC_BLOCKBOOK_URL`
*   **Endereços Alvo (Targets)**:
    *   **Puzzle 71**: `1PWo3JeB9jrGwfHDNpdGK54CRas7fsVzXU`
    *   **Puzzle 72**: `1JTK7s9YVYywfm5XUH7RNhHJH1LshCaRFR` (Chave pública: `02d3b2bf405ef79919fb9db4f93318b87ee25ea556db1b7596b52fb58fbc8d01e4`)
    *   **Puzzle 73**: `12VVRNPi4SJqUTsp6FmqDqY5sGosDtysn4`
*   **Controle de Taxa (Rate Limit)**:
    *   Delay entre requisições: `2000ms` (`BTC_PUBLIC_API_DELAY_MS`) - necessário para evitar bloqueios IP temporários na API pública do Blockchain.info.
    *   Mecanismo de fallback automático para erro HTTP `429` com cooldown de `10s`.

---

## 🔍 Scripts de Validação e Auditoria

Para testar e certificar que todos os resolvedores do projeto estão comunicando-se corretamente com seus respectivos endpoints de rede, utilize os scripts integrados:

1.  **Validador de RPC** ([test-rpc-endpoints.js](file:///var/home/recifecrypto/2--71-72-73/test-rpc-endpoints.js)): Executa chamadas leves (ex: `eth_chainId`, `getHealth`) em cada rede para testar tempo de resposta e integridade.
    ```bash
    # Executa a verificação centralizada das configurações
    node test-rpc-endpoints.js
    ```
2.  **Validador de Configuração** ([test-config.js](file:///var/home/recifecrypto/2--71-72-73/test-config.js)):
    ```bash
    node test-config.js
    ```
3.  **Auditoria de Rede Ethereum** ([audit_ethereum_network.py](file:///var/home/recifecrypto/2--71-72-73/audit_ethereum_network.py)): Executa uma auditoria completa da RPC Ethereum (Ankr), testando latência, chamadas padrão (blockNumber, chainId), chamadas proprietárias (Ankr Token API) e conexão com Etherscan API.
    ```bash
    python3 audit_ethereum_network.py
    ```
