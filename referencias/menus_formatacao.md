# 📖 Menus e Formatação de Texto — Referência Rápida

> [← Voltar à página principal](../README.md)

---

## 1. Alinhamento e preenchimento com f-strings

```python
nome = "FALCON"
nivel = 4

f"{nome:<12}"        # 'FALCON      '  ← alinhado à esquerda (12 chars)
f"{nome:>12}"        # '      FALCON'  ← alinhado à direita
f"{nome:^12}"        # '   FALCON   '  ← centrado
f"{nivel:>5}"        # '    4'         ← número à direita

# Com preenchimento de caracter
f"{nome:─^20}"       # '───────FALCON───────'
f"{'':─<40}"         # '────────────────────────────────────────'  ← linha separadora
f"{nome:*^20}"       # '*******FALCON*******'
```

### Tabela resumo

| Símbolo | Significado | Exemplo |
|---|---|---|
| `<` | Alinha à esquerda | `f"{'abc':<10}"` → `'abc       '` |
| `>` | Alinha à direita | `f"{'abc':>10}"` → `'       abc'` |
| `^` | Centra | `f"{'abc':^10}"` → `'   abc    '` |
| `─^N` | Centra com preenchimento | `f"{'título':─^20}"` |
| `0>N` | Preenche com zeros | `f"{7:0>3}"` → `'007'` |

---

## 2. Repetição de caracteres

```python
print("─" * 40)    # ────────────────────────────────────────
print("=" * 40)    # ========================================
print("█" * 10)    # ██████████
print(" " * 5)     # 5 espaços

# Bordas de caixa
print("╔" + "═" * 38 + "╗")
print("║" + " " * 38 + "║")
print("╚" + "═" * 38 + "╝")
```

### Caracteres úteis para terminais

| Tipo | Caracteres |
|---|---|
| Linha simples | `─ │ ┌ ┐ └ ┘ ├ ┤ ┬ ┴ ┼` |
| Linha dupla | `═ ║ ╔ ╗ ╚ ╝ ╠ ╣ ╦ ╩ ╬` |
| Blocos | `█ ▓ ▒ ░` |
| Setas | `→ ← ↑ ↓ ▶ ◀` |

---

## 3. Tipos de menu

### Menu simples

```python
while True:
    print("\n[1] Listar  [2] Adicionar  [3] Sair")
    op = input("Opção: ").strip()
    if op == "1":
        listar()
    elif op == "2":
        adicionar()
    elif op == "3":
        break
    else:
        print("❌ Opção inválida.")
```

---

### Menu com caixa (estilo Simulador)

```python
def mostrar_menu():
    print("\n╔══════════════════════════════════════╗")
    print("║        SIMULADOR v4.0 — MENU         ║")
    print("╠══════════════════════════════════════╣")
    print("║  [1] Listar agentes ativos           ║")
    print("║  [2] Adicionar agente                ║")
    print("║  [3] Promover agente                 ║")
    print("║  [4] Desativar agente                ║")
    print("║  [5] Exportar relatório              ║")
    print("║  [0] Sair                            ║")
    print("╚══════════════════════════════════════╝")
```

> 💡 Todas as linhas têm de ter o mesmo número de caracteres entre `║` e `║` para as bordas ficarem alinhadas.

---

### Menu com dicionário de funções (o mais limpo)

```python
opcoes = {
    "1": listar,
    "2": adicionar,
    "3": promover,
    "4": desativar,
    "5": exportar,
}

while True:
    print("\n[1] Listar  [2] Adicionar  [3] Promover  [4] Desativar  [5] Exportar  [0] Sair")
    op = input("Opção: ").strip()
    if op == "0":
        break
    elif op in opcoes:
        opcoes[op]()          # chama a função diretamente
    else:
        print("❌ Opção inválida.")
```

> 💡 Com o dicionário não precisas de `if/elif` para cada opção — o código cresce menos à medida que adicionas opções.

---

## 4. Tabelas no terminal

```python
# Cabeçalho
print(f"\n  {'CODENAME':<12} {'NÍVEL':>5} {'ESTADO':<8}")
print("  " + "─" * 28)

# Linhas de dados
agentes = [("FALCON", 4, True), ("GHOST", 2, False), ("RAVEN", 3, True)]
for codename, nivel, ativo in agentes:
    estado = "✅ ativo" if ativo else "❌ inativo"
    print(f"  {codename:<12} {nivel:>5} {estado:<8}")

print("  " + "─" * 28)
print(f"  Total: {len(agentes)} agentes")
```

**Output:**
```
  CODENAME     NÍVEL ESTADO
  ────────────────────────────
  FALCON           4 ✅ ativo
  GHOST            2 ❌ inativo
  RAVEN            3 ✅ ativo
  ────────────────────────────
  Total: 3 agentes
```

---

## 5. Título centrado com linha

```python
def titulo(texto, largura=40):
    print("\n" + "═" * largura)
    print(f"{texto:^{largura}}")
    print("═" * largura)

titulo("SIMULADOR v4.0")
# ════════════════════════════════════════
#             SIMULADOR v4.0
# ════════════════════════════════════════
```

---

*UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026*
