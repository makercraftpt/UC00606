# 📖 Referência — Aprender e Desenvolver com Ajuda de IA

> [← Voltar à página principal](../README.md)

---

## Porquê este guia?

Uma IA (ChatGPT, Claude, Copilot...) consegue escrever a maior parte destes exercícios em segundos. Isso não é o problema — é a **oportunidade**. A questão é *quando* e *como* a usas.

> **Primeiro o cérebro. Depois o código. Por fim, a IA.**

Se pedires a solução logo na primeira linha, aprendes a **copiar**. Se pensares primeiro, tentares sozinho, e só depois usares a IA para rever ou aprofundar, aprendes a **programar** — e a IA passa a ser uma ferramenta poderosa, não uma muleta.

---

## O método — 5 passos

```
1. PENSAR      →  2. PLANEAR      →  3. FAZER
   (o quê)          (como, em          (código teu, com
                      palavras)          referências)
                                              ↓
5. QUESTIONAR A IA   ←   4. TESTAR
   (rever ou aprender)      (correr, falhar, ajustar)
```

### 1. Pensar — o que queres construir?

Escreve **uma frase**, sem código nenhum, do que o teu programa vai fazer.

> *"Quero encontrar todos os IPs suspeitos num ficheiro de log."*

Se não conseguires escrever esta frase, ainda não percebeste o problema — e a IA não resolve isso, quem tem de perceber o problema és tu.

### 2. Planear — como vais resolver?

Antes de abrires o PyCharm, responde em palavras (ou pseudocódigo):

- Que conceito resolve isto? (`split()`? regex? um `for`?)
- Que referência vais consultar? — [Regex](regex.md), [Split/Join](split.md), [Funções](funcoes.md)...
- Qual é o "esqueleto" da solução, passo a passo?

> *"A hora tem três grupos de dois algarismos separados por `:`. O IP tem quatro grupos de números separados por `.`. Posso usar `re.search()` para procurar cada um."*

### 3. Fazer — escreve o código sozinho

Consultas as referências do site, não a IA. Se travares, é normal — travar faz parte de aprender.

> A única exceção: podes pedir à IA para **explicar um conceito** que não percebas (não para resolver o exercício). Ver o papel de **Tutor** abaixo.

### 4. Testar

Corre o código com os dados do enunciado — e depois com casos que **tu** inventas. É aqui que aparecem os problemas reais: formatos inesperados, valores no limite, dados inválidos.

### 5. Questionar a IA — só agora

Chegaste a uma solução que funciona (ou quase)? A IA entra com um destes três papéis — nunca para resolver do zero:

| Papel | Serve para | Como pedir |
|-------|-----------|------------|
| **Tutor** | Explicar um conceito que não percebes | *"Explica-me a diferença entre `\d+` e `\d{1,3}` com um exemplo."* |
| **Revisor** | Analisar a tua solução já feita | *"Revê o meu regex. Há algum caso real que ele não apanhe? Não escrevas uma solução nova."* |
| **Desafiador** | Criar casos de teste que tu não pensaste | *"Cria cinco linhas de log para testar o meu padrão: casos normais, casos limite e dados inválidos."* |

---

## Como pedir bem (e mal) à IA

```
❌ "Escreve-me um regex para apanhar IPs de um log."
   → Resolve o exercício por ti. Não aprendeste nada.

❌ "Está errado, dá-me o código certo."
   → Aceitas a correção sem perceber porquê. Vais repetir o erro.

✔ "Escrevi este regex: r'\d{1,3}(?:\.\d{1,3}){3}'. Testei com 3 logs
   normais e funcionou. Há algum caso real de IP que ele não cubra?"
   → Mostras o que tentaste e pedes uma revisão dirigida, sem entregares
     o raciocínio.

✔ "Não percebo a diferença entre (...)  e (?:...) num regex.
   Explica com um exemplo diferente do meu exercício."
   → Pedes o conceito, não a resposta.
```

---

## Exemplo completo — Analisador de Logs com Regex

Linha de log da Ficha B da [Semana 7](../semanas/semana07.md):

```
14:32:07 ERRO IP=10.0.0.5 login falhou
```

**1. Pensar:** quero extrair `14:32:07` e `10.0.0.5` desta linha.

**2. Planear:** a hora são 3 grupos de 2 dígitos separados por `:`. O IP são 4 grupos de dígitos separados por `.`. Uso `re.search()` para cada um.

**3. Fazer:**
```python
hora = re.search(r"\d{2}:\d{2}:\d{2}", linha)
ip   = re.search(r"\d{1,3}(?:\.\d{1,3}){3}", linha)
```

> 💡 Repara no `(?:...)` em vez de `(...)`. Se mais tarde usares `re.findall()` com este padrão, um grupo capturante normal (`(...)`) faz o `findall()` devolver só o conteúdo do grupo (ex.: `.5`), não o IP completo — é um erro muito comum. O `(?:...)` é um **grupo não-capturante**: agrupa para o `{3}` funcionar, mas não interfere no resultado.

**4. Testar** com mais do que o exemplo óbvio:
```
09:05:02 INFO IP=192.168.1.20 sessão iniciada
23:59:59 ERRO login sem endereço IP
14:32:07 ERRO IP=999.999.999.999 endereço inválido
```

A terceira linha revela algo importante: o padrão **casa** com `999.999.999.999`, que tem o formato de um IP mas não é um endereço válido (cada parte devia ir de 0 a 255).

**5. Questionar a IA:** *"O meu padrão `\d{1,3}(?:\.\d{1,3}){3}` reconhece `999.999.999.999`. Isto é um problema? Como é que um regex mais rigoroso validaria cada parte entre 0 e 255?"*

Isto leva a uma pergunta pedagógica valiosa, e que a IA pode ajudar a explorar: **o regex valida mesmo um endereço IP, ou só reconhece algo com o formato de um IP?** (Resposta: só o formato — validar o intervalo 0-255 exige um regex bem mais complexo, ou uma verificação extra em Python depois do `match`.)

---

## Registo rápido de utilização da IA

Para cada exercício onde uses IA, vale a pena deixar um pequeno registo — obriga-te a mostrar o raciocínio, não só o resultado:

```
Problema:    o que eu queria obter
Estratégia:  os passos que planeei
Tentativa:   a minha primeira solução
Teste:       que dados usei e o que falhou
IA:          o que perguntei e o que mudei depois
```

---

## Erros comuns a evitar

- **"Vibe coding"** — colar código sugerido pela IA sem perceber uma linha. Se não consegues explicar o que o código faz, não o entregues.
- **Pedir a solução completa "para poupar tempo"** — poupas 10 minutos agora e perdes a matéria toda.
- **Aceitar a primeira sugestão da IA sem testar** — a IA também erra, especialmente em casos específicos (regex é um dos temas onde isto acontece mais).
- **Usar a IA como primeiro recurso em vez de último** — antes da IA, tenta: reler o enunciado, consultar a referência, testar em `regex101.com`, pedir a um colega.

---

<sub>← [Voltar](../README.md) · [Regex](regex.md) · [Semana 7](../semanas/semana07.md)</sub>
