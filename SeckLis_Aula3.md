# ✅ SeckLis — Aula 3: Ciclos `while`

> Revê esta lista antes de entrar na sala. 5 minutos que poupam surpresas.

---

## 🖥️ Ambiente

- [ ] PyCharm aberto e testado no projetor
- [ ] Terminal Python funcional (`python --version`)
- [ ] Repositório GitHub atualizado (semana03.md visível)
- [ ] Ficheiro `.drawio` da aula aberto no browser (app.diagrams.net)
- [ ] Slides abertos e no slide 1

---

## 📋 Conteúdo — o que vais ensinar hoje

### Conceitos核 core
- [ ] `while condição:` — ciclo repete enquanto a condição for `True`
- [ ] Variável de controlo — tem de mudar dentro do ciclo (senão ciclo infinito!)
- [ ] `break` — sair do ciclo imediatamente
- [ ] `continue` — saltar para a próxima iteração
- [ ] Ciclo de validação — padrão clássico: pedir input até ser válido

### Padrões a mostrar no código
```python
# Padrão 1 — Contador
i = 1
while i <= 5:
    print(i)
    i += 1          # ← NÃO ESQUECER isto ou ciclo infinito

# Padrão 2 — Validação (o mais útil para os alunos)
password = ""
while password != "1234":
    password = input("Password: ")
print("Acesso concedido ✅")

# Padrão 3 — break
while True:
    resposta = input("Continuar? (s/n): ")
    if resposta == "n":
        break
```

### Erro mais comum a antecipar
```python
# ⚠️ Ciclo infinito — alguém vai fazer isto
i = 1
while i <= 5:
    print(i)
    # esqueceu o i += 1
```
> Mostra como sair: **Ctrl+C** no terminal. Vale a pena demonstrar de propósito.

---

## 🎯 Estrutura da aula (sugestão)

| Tempo | Momento | Nota |
|-------|---------|------|
| 0–10 min | **Desafio de abertura** — mostrar o problema sem dar a solução | Ativa a turma antes da teoria |
| 10–25 min | Teoria: `while`, variável de controlo, padrões | Máx. 2 exemplos ao vivo |
| 25–30 min | Fluxograma `while` no Draw.io | Mostrar antes do código |
| 30–35 min | Missão v0.3 ao vivo (password com `while`) | Continuidade da missão |
| 35–80 min | Fichas (B★★ → A★ → C★★★) | Circular pela sala |
| 80–90 min | Extra / Wrap-up / XP | Quem acabou cedo |

---

## 📁 Ficheiros para ter prontos

- [ ] `Aula3_Ciclos_while.pptx` — slides da aula
- [ ] `Fichas_Aula3_UC00606.docx` — fichas impressas ou partilhadas
- [ ] `fluxogramas_aula3.drawio` — aberto em app.diagrams.net
- [ ] Código da Missão v0.2 (aula anterior) para partir daí

---

## 💬 Frases para usar na aula

- *"O `while` é como um segurança na porta — enquanto a condição for verdadeira, não passa."*
- *"Se o ciclo não parar, o teu programa ficou preso. Ctrl+C é o teu amigo."*
- *"Antes de escrever o while, pergunta: o que tem de mudar a cada volta?"*

---

## 🏆 Missão Contínua — v0.3

A versão desta aula adiciona:
- Loop de autenticação — pede password até 3 tentativas
- Contador de tentativas falhadas
- Mensagem de bloqueio se esgotar tentativas

```python
# Preview v0.3
tentativas = 0
while tentativas < 3:
    password = input("Password: ")
    if password == "cyber2025":
        print("✅ Acesso concedido")
        break
    tentativas += 1
    print(f"❌ Tentativa {tentativas}/3")
else:
    print("🔒 Sistema bloqueado. Demasiadas tentativas.")
```

> Nota: o `else` do `while` corre quando a condição se torna `False` (não quando há `break`) — bom momento para mostrar este padrão avançado se a turma estiver bem.

---

## ⚡ Se a turma estiver perdida

Volta ao padrão mais simples possível:

```python
resposta = ""
while resposta != "sair":
    resposta = input("Escreve 'sair' para terminar: ")
print("Bye!")
```

Um ciclo, uma condição, um input. Só depois avança.

---

<sub>UC00606 · Aula 3 · ETPS · 2025/2026</sub>
