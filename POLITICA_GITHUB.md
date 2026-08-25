# Política de GitHub da Disciplina

## Finalidade

O GitHub registra o desenvolvimento técnico das atividades. O SIGAA continua sendo o ambiente oficial para prazos, envio formal e notas.

## Um fork por estudante

Cada estudante deve manter um único fork deste repositório durante a disciplina:

- `origin`: o fork do estudante;
- `upstream`: o repositório oficial da disciplina.

Configuração inicial, substituindo `SEU-USUARIO`:

```bash
git clone https://github.com/SEU-USUARIO/falect-cc-035-processamento-de-alto-desempenho.git
cd falect-cc-035-processamento-de-alto-desempenho
git remote add upstream https://github.com/Lucas-Sperotto/falect-cc-035-processamento-de-alto-desempenho.git
git remote -v
```

## Regra para a `main`

A branch `main` do fork deve acompanhar o material publicado pelo professor. Não desenvolva atividades diretamente nela.

Antes de iniciar uma atividade:

```bash
git switch main
git fetch upstream
git merge --ff-only upstream/main
git push origin main
```

Se o `merge --ff-only` falhar, pare e peça orientação. Não use `push --force`, `reset --hard` ou comandos encontrados ao acaso para contornar o problema.

## Branch por atividade

Crie a branch a partir da `main` já sincronizada:

```bash
git switch -c atividade/nome-da-atividade
```

Padrões usuais:

- `atividade/lista-01`
- `atividade/laboratorio-01`
- `projeto/etapa-01`
- `correcao/laboratorio-01`

Use somente letras minúsculas, números, barras e hífens.

Por padrão, a branch nasce da `main`. Em projetos cumulativos, o enunciado indicará a branch da etapa anterior que deve ser usada como base; não presuma essa dependência.

## Commits

Faça commits pequenos, coerentes e distribuídos ao longo do desenvolvimento. Exemplos:

- `feat: implementa versão sequencial`
- `feat: paraleliza laço com OpenMP`
- `test: adiciona medições com quatro threads`
- `fix: corrige condição de corrida`
- `docs: registra ambiente e resultados`

Antes de cada commit:

```bash
git status
git diff
```

Não use o histórico para armazenar executáveis, credenciais, dados pessoais ou arquivos de entrega do SIGAA.

## Envio da branch

```bash
git push -u origin atividade/nome-da-atividade
```

O enunciado informa se basta enviar o link da branch ou se é necessário abrir um Pull Request.

### Destino padrão do Pull Request

Quando o enunciado pedir Pull Request sem indicar outro destino, abra-o da branch do seu fork para a `main` do repositório oficial da disciplina. O professor fará a revisão e normalmente encerrará o Pull Request sem incorporar a solução à `main`.

Pull Requests, branches e commits enviados a um fork deste repositório são públicos. Atividades que exijam sigilo terão outro canal ou um repositório privado indicado no enunciado; nesse caso, **não faça push da solução para o fork público** e não abra Pull Request público.

Use o modelo de Pull Request para registrar:

- atividade e usuário GitHub;
- o que foi implementado;
- como compilar e executar;
- testes e resultados;
- limitações conhecidas;
- uso de IA, quando o enunciado exigir.

## Correções

Enquanto o Pull Request estiver aberto, novos commits na mesma branch o atualizarão. Depois de uma entrega encerrada, siga a orientação do professor. O enunciado da correção indicará se `correcao/nome-da-atividade` deve nascer da branch entregue ou da `main`.

Não apague nem reescreva commits já enviados para esconder o processo. Não use `push --force` em branches de entrega.

No prazo, registre o commit exato avaliado:

```bash
git rev-parse HEAD
```

Um link de branch pode mudar; o hash do commit identifica de forma imutável a versão entregue. Crie tags somente quando o enunciado solicitar.

## Registro no SIGAA

Quando solicitado, envie pelo SIGAA o relatório curto com:

- nome e identificação da atividade;
- link do fork;
- link da branch;
- link do Pull Request ou do commit indicado;
- resumo objetivo do trabalho;
- declaração de uso de IA, se exigida.

O modelo está em [`templates/relatorio-sigaa.md`](templates/relatorio-sigaa.md). O relatório preenchido contém dados pessoais e não deve ser commitado.

## Autoria e integridade

Não é permitido:

- copiar integralmente o repositório de outra pessoa;
- entregar código que não consegue explicar;
- fabricar ou substituir o histórico para simular desenvolvimento;
- publicar soluções de avaliações por canal não autorizado;
- usar código ou texto de terceiros sem atribuição;
- contrariar a regra de IA do enunciado.

O estudante é responsável por revisar o conteúdo antes de publicá-lo. Em caso de conflito, prevalecem o enunciado da atividade e as orientações registradas no SIGAA.
