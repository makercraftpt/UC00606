# 📅 Semana 3 — Ciclos: `while`

> **UC00606 · Linguagem Estruturada · Aula 3**  
> Tema: Ciclos · `while` · `break` · `continue` · Validação de Input

---

## 🎯 O que aprendemos esta semana

- Repetir código com **`while`** enquanto uma condição for verdadeira
- Usar uma **variável de controlo** para evitar ciclos infinitos
- Sair de um ciclo com **`break`**
- Saltar uma iteração com **`continue`**
- Validar input do utilizador com o **padrão de validação**
- Usar **`while / else`** para detetar se o ciclo esgotou as tentativas
- Evoluir a **Missão Contínua** para a versão 0.3

---

## ⚡ Resumo rápido — o essencial

### Estrutura `while`

```python
while condição:
    # código a repetir
    # OBRIGATÓRIO: mudar a variável de controlo!
```

> ⚠️ Se a variável de controlo nunca mudar, o ciclo nunca termina — **ciclo infinito**. Para sair: **Ctrl+C** no terminal.

---

### Padrão 1 — Contador

```python
i = 1
while i <= 5:
    print(f"Volta {i}")
    i += 1          # ← essencial!

# Saída: Volta 1, Volta 2, Volta 3, Volta 4, Volta 5
```

---

### Padrão 2 — Validação de Input

```python
nota = -1
while nota < 0 or nota > 20:
    nota = float(input("Nota (0-20): "))
    if nota < 0 or nota > 20:
        print("Nota invalida. Tenta outra vez.")

print(f"Nota registada: {nota}")
```

> 💡 Inicializa a variável com um valor **inválido** antes do ciclo — assim entra sempre na primeira vez.

---

### Padrão 3 — `while True` + `break`

```python
while True:
    resposta = input("Comando (ou 'sair'): ")
    if resposta == "sair":
        break
    print(f"Executado: {resposta}")

print("Programa terminado.")
```

---

### `break` e `continue`

```python
# break — sai imediatamente do ciclo
i = 0
while i < 10:
    i += 1
    if i == 5:
        break       # para no 5
print(i)  # → 5

# continue — salta para a próxima iteração
i = 0
while i < 6:
    i += 1
    if i % 2 == 0:
        continue    # salta os pares
    print(i)        # → 1, 3, 5
```

---

### `while / else` — padrão avançado

```python
tentativas = 0
while tentativas < 3:
    pw = input("Password: ")
    if pw == "cyber2025":
        print("Acesso concedido!")
        break
    tentativas += 1
else:
    # só corre se a condição ficou False (não houve break)
    print("Sistema bloqueado.")
```

> O `else` do `while` **não corre** se houver `break` — só corre quando o ciclo termina naturalmente.

---

## 🔒 Missão Contínua — v0.3

Esta semana o simulador ganhou **autenticação com tentativas limitadas**:

```python
# ═══════════════════════════════════════════════
# MISSÃO CONTÍNUA — Simulador de Hacking v0.3
# ═══════════════════════════════════════════════

print("=" * 48)
print("  SISTEMA DE CONTROLO — CyberBase Alpha v0.3")
print("=" * 48)

nome  = input("Identificação: ")
nivel = input("Nível (admin/user/guest): ")

tentativas = 0
while tentativas < 3:
    pw = input("Password: ")
    if pw == "cyber2025":
        print(f"\nBem-vindo, {nome}. Acesso {nivel} concedido.")
        break
    tentativas += 1
    print(f"Tentativa {tentativas}/3 falhada.")
else:
    print(f"\n{nome}, o teu acesso foi bloqueado.")
```

> Na próxima aula (Semana 4) adicionamos ciclos `for` e listas — o sistema vai registar um histórico de tentativas. 📋

---

## 📚 Para aprofundar

- [Referência — Ciclos](../referencias/ciclos.md) — Sintaxe completa, padrões e exemplos
- [Fluxogramas + Draw.io](../referencias/fluxogramas.md) — Como desenhar diagramas de ciclos
- [Documentação oficial Python — `while`](https://docs.python.org/pt/3/reference/compound_stmts.html#the-while-statement)

---

## 💻 Exercícios desta semana

| Ficha | Dificuldade | Tema |
|-------|-------------|------|
| Ficha B | ★★ Médio | Guardião da Porta — PIN com 3 tentativas + bloqueio |
| Ficha A | ★ Fácil | Ciclo de Boas-vindas — menu com `while True` + `break` |
| Ficha C | ★★★ Difícil | Força Bruta Simulada — contador de tentativas + estatísticas |
| Ficha Extra | 🏠 Casa | 5 desafios extra com XP — do mais difícil para o mais fácil |

> As fichas em PDF estão disponíveis na pasta `exercicios/`.

---

<sub>UC00606 · Linguagem Estruturada · ETPS · 2025/2026 · Semana 3</sub>
