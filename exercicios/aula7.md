# 💻 Exercícios — Aula 7: Strings & Regex

> **UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026**

---

## 📋 Fichas disponíveis

| Ficha | Dificuldade | Tema | Tempo |
|-------|-------------|------|-------|
| **Ficha A** | ★ Fácil | Formatador de Endereços IP | 35 min |
| **Ficha B** | ★★ Médio | Analisador de Logs com Regex | 50 min |
| **Ficha C** | ★★★ Difícil | Gerador de Wordlist | 60 min |
| **Ficha Extra** | 🏠 Casa / Final de Aula | 5 desafios com XP | à tua escolha |

> Começamos pela Ficha A — limpar e validar um IP com métodos de string, antes de entrar em regex na Ficha B.

---

## ⚡ Resumo dos exercícios

### Ficha A — Formatador de Endereços IP ★
Limpar e validar o formato de um IP recebido com espaços a mais e pontos duplicados.

**Conceitos:** `strip()`, `replace()`, `split()`, `len()`

---

### Ficha B — Analisador de Logs com Regex ★★
Extrair todos os IPs e todas as horas (HH:MM:SS) de uma lista de logs, e contar quantas linhas são de cada tipo (INFO/AVISO/ERRO).

**Conceitos:** `import re`, `re.findall()`, padrões para IP e timestamp

---

### Ficha C — Gerador de Wordlist ★★★
Gerar variações de uma palavra-base (números no fim, maiúscula inicial, substituições `a→@`, `e→3`, `i→1`) para testar a robustez de uma password.

**Conceitos:** `set()`, `range()`, `str.replace()` encadeado

---

### Ficha Extra — Desafios Adicionais 🏠
5 exercícios com strings e regex para quem acabar cedo ou quiser praticar em casa:

| # | Exercício | XP |
|---|-----------|-----|
| 1 | Extrator de Domínios de URLs | +50 XP |
| 2 | Detetor de Palavras Suspeitas | +40 XP |
| 3 | Anagramas de Segurança | +30 XP |
| 4 | Codificador ROT13 | +40 XP |
| 5 | Analisador de Password v2 (regex) | +60 XP |

---

## 💡 Dica antes de começar

Antes de escreveres um padrão regex, responde a estas três perguntas:

1. **O que estou mesmo à procura?** — um número, uma palavra, um formato fixo?
2. **A posição é sempre a mesma?** — se sim, um método de string (`split`, `find`) pode chegar.
3. **Preciso de um resultado ou de todos?** — `re.search()` vs `re.findall()`.

Testa sempre o padrão com um exemplo pequeno antes de o aplicar aos dados todos.

---

<sub>UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026 · Aula 7</sub>
