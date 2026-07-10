# 💻 Exercícios — Aula 5: Funções

> **UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026**

---

## 📋 Fichas disponíveis

| Ficha | Dificuldade | Tema | Tempo |
|-------|-------------|------|-------|
| **Ficha A** | ★ Fácil | Funções Básicas | 35 min |
| **Ficha B** | ★★ Médio | Calculadora de Segurança | 50 min |
| **Ficha C** | ★★★ Difícil | Analisador de Passwords | 60 min |
| **Ficha Extra** | 🏠 Casa / Final de Aula | 5 desafios com XP | à tua escolha |

> Começamos pela Ficha A — as primeiras funções com `return`, antes de combinar várias funções nas fichas seguintes.

---

## ⚡ Resumo dos exercícios

### Ficha A — Funções Básicas ★
Cinco funções simples: `saudar()`, `quadrado()`, `e_par()`, `classificar_idade()` e um mini-programa que as usa todas juntas.

**Conceitos:** `def`, `return`, parâmetros, operador `%`

---

### Ficha B — Calculadora de Segurança ★★
Um supervisor pediu uma ferramenta que classifica o risco de vários sistemas (`classificar_risco()`), calcula a média (`calcular_media()`) e imprime um relatório completo (`relatorio_sistemas()`) que combina as duas funções anteriores. Desafio extra: contar quantos sistemas são críticos.

**Conceitos:** funções que chamam outras funções, acumuladores, f-strings com alinhamento (`{nome:15}`)

---

### Ficha C — Analisador de Passwords ★★★
Quatro funções de verificação (`tem_comprimento()`, `tem_maiuscula()`, `tem_digito()`, `tem_simbolo()`) que devolvem `True`/`False`, combinadas numa função `calcular_forca()` que pontua a password (0 a 4) e classifica o nível, e uma função final `analisar_password()` que imprime o relatório.

**Conceitos:** funções booleanas, composição de funções, `len()`, `str.isupper()`, `str.isdigit()`

---

### Ficha Extra — Desafios Adicionais 🏠
5 exercícios de funções em contextos variados, terminando com um desafio de composição (uma função que chama todas as anteriores):

| # | Exercício | XP |
|---|-----------|-----|
| 1 | Cifra de César com função | +50 XP |
| 2 | Validador de Email Simples | +40 XP |
| 3 | Gerador de Senha (nome + ano) | +30 XP |
| 4 | Contar Vogais numa String | +30 XP |
| 5 | Função dentro de Função — Relatório de Agente | +60 XP |

---

## 💡 Dica antes de começar

Antes de escreveres uma função, responde a estas três perguntas:

1. **O que é que ela recebe?** — os parâmetros e o seu tipo
2. **O que é que ela devolve?** — um valor, vários, ou nada (`None`)
3. **Faz só uma coisa?** — se a resposta for não, é sinal de dividir em duas funções

---

<sub>UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026 · Aula 5</sub>
