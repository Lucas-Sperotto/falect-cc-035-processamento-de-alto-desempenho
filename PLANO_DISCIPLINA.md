# Plano da Disciplina — Processamento de Alto Desempenho

## Identificação

- Curso: Bacharelado em Ciência da Computação
- Instituição: UNEMAT — Campus Universitário de Alto Araguaia
- Código: FALECT-CC-035
- Carga horária total: 60 horas
- Distribuição: 45 horas presenciais e 15 horas EAD
- Créditos: 3 teóricos + 1 prático
- Pré-requisito no PPC: não possui
- Professor: Prof. Me. Lucas Kriesel Sperotto
- Linguagens e modelos principais: C/C++, OpenMP, MPI e CUDA

As informações específicas da oferta — turma, datas, prazos e distribuição de notas — são publicadas no SIGAA.

A preparação inicial também verifica Fortran, Python, Java e Julia como ferramentas complementares para scripts, comparações ou exemplos. A instalação não significa que todas serão objeto de avaliação; cada enunciado define o ambiente exigido.

## Ementa

Avaliação e medidas de desempenho (speedup e lei de Amdahl). Conceitos de processamento vetorial e comparação vetorial versus escalar. Modelos, características e funcionamento de máquinas vetoriais. Algoritmos paralelos e princípios de paralelismo. Redes de interconexão e protocolos de alto desempenho. Arquiteturas SIMD/MIMD. Escalonamento e balanceamento de carga. Multiprocessadores e multicomputadores. Modelos de acesso à memória e modelos de comunicação. Pacotes paralelos para funções matemáticas. Afinidade de dados em memória cache e influência da cache no desempenho. Programação com OpenMP, MPI-1 e MPI-2. Programação C/C++-CUDA para GPUs. Introdução a PGAS e computação em grade.

## Objetivo geral

Estudar fundamentos de programação paralela para diferentes arquiteturas, visando ao desenvolvimento de software de alto desempenho, especialmente para computação científica.

## Objetivos específicos

Ao final da disciplina, o estudante deverá ser capaz de:

- aplicar métricas e ferramentas de avaliação de desempenho;
- reconhecer características de arquiteturas paralelas e seus efeitos no software;
- decompor problemas e identificar oportunidades e limites de paralelismo;
- desenvolver, testar e analisar programas com OpenMP, MPI e CUDA;
- avaliar efeitos de cache, comunicação, sincronização e balanceamento de carga;
- comparar implementações com experimentos reprodutíveis;
- documentar decisões técnicas e usar versionamento de forma responsável.

## Unidades

### 1. Desempenho e arquiteturas paralelas

- speedup, eficiência, escalabilidade e lei de Amdahl;
- processamento escalar e vetorial;
- arquiteturas SIMD/MIMD;
- memória, interconexões e modelos de comunicação.

### 2. Memória compartilhada e OpenMP

- decomposição, concorrência e sincronização;
- escalonamento e balanceamento de carga;
- cache, localidade e afinidade de dados;
- programação e medição com OpenMP.

### 3. Memória distribuída e MPI

- processos e comunicação ponto a ponto;
- operações coletivas e topologias;
- custos de comunicação;
- experimentos com MPI.

### 4. Aceleradores e modelos complementares

- modelo de execução e hierarquia de memória em GPUs;
- programação C/C++ com CUDA;
- introdução a PGAS e computação em grade;
- benchmark comparativo e síntese dos resultados.

## Metodologia

Os encontros combinam explicação conceitual, resolução de problemas, demonstrações e prática em laboratório. O estudante deverá reproduzir experimentos, medir resultados, justificar decisões e registrar o desenvolvimento no GitHub.

As atividades EAD preparam, reforçam ou consolidam o trabalho presencial. O [cronograma](CRONOGRAMA.md) identifica a modalidade de cada encontro; a contabilização da carga horária segue o calendário acadêmico e os registros do SIGAA.

Ao final dos encontros poderá ser solicitado um resumo breve sobre o que foi compreendido, as dúvidas restantes e o que precisa ser praticado.

## Avaliação

A avaliação considera processo e produto: correção técnica, metodologia experimental, interpretação dos resultados, organização, documentação, histórico de desenvolvimento e capacidade de explicar o trabalho.

Os instrumentos podem incluir listas, laboratórios, atividades EAD, verificações práticas e um trabalho integrador. Os pesos, prazos e requisitos de cada entrega serão informados no SIGAA e nos enunciados. Consulte [AVALIACAO.md](AVALIACAO.md).

## Uso de GitHub e IA

- O fluxo de fork, branches, commits e Pull Requests está em [POLITICA_GITHUB.md](POLITICA_GITHUB.md).
- Cada atividade informa se o uso de IA é permitido. As regras gerais estão em [POLITICA_IA.md](POLITICA_IA.md).

## Referências

A bibliografia e a documentação técnica estão em [REFERENCIAS.md](REFERENCIAS.md).

O PPC do curso é regido pela [Resolução nº 58/2023 — CONEPE/UNEMAT](https://www.unemat.br/resolucoes/resolucoes/conepe/5298_res_conepe_58_2023.pdf).
