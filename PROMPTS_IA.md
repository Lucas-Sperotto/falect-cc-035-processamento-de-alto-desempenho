# Prompts Orientados para Estudo

Use estes modelos somente quando o enunciado marcar **IA permitida**. Inclua o contexto necessário, mas nunca envie credenciais, dados pessoais, enunciados sigilosos ou código de terceiros sem autorização.

## Tutor técnico

```text
Atue como tutor técnico. Não resolva a atividade inteira para mim.

Primeiro, faça perguntas para verificar o que eu já entendi. Depois:
- explique o conceito envolvido;
- proponha passos incrementais;
- use exemplos pequenos e diferentes do meu problema;
- sugira testes;
- peça que eu preveja o resultado antes de continuar.

Se eu pedir código completo, ajude-me a construir e validar uma parte por vez.
```

## Depuração

```text
Ajude-me a depurar este trecho sem reescrever a solução inteira.

Quero:
- hipóteses priorizadas para o erro;
- observações ou testes que distinguem cada hipótese;
- explicação do comportamento;
- uma correção incremental por vez;
- um teste de regressão ao final.

Antes de sugerir a correção, peça a mensagem de erro completa, a forma de compilação,
a entrada usada, a saída esperada e a saída observada.
```

## Análise de desempenho

```text
Ajude-me a revisar o desenho deste experimento de desempenho sem inventar resultados.

Verifique:
- qual é a baseline;
- quais variáveis precisam permanecer controladas;
- número de repetições e forma de resumir os tempos;
- correção das métricas de speedup e eficiência;
- possíveis efeitos de aquecimento, cache, afinidade e comunicação;
- quais informações tornam o experimento reproduzível.

Faça perguntas e aponte ameaças à validade. Não produza medições que eu não executei.
```

## Validação obrigatória

Uma resposta de IA é apenas uma hipótese. Confira documentação, compile com avisos habilitados, execute testes próprios e registre o que realmente observou.
