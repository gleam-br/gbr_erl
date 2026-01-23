# Contexto: gbr_erl
Extensão da gbr_shared focada no target Erlang/OTP.

## Regras de Ouro para o Gemini:
1. **Uso de @external:** Sempre utilize a anotação `@external(erlang, "modulo", "funcao")` para acessar o ecossistema Erlang.
2. **Logs de Alta Performance:** Referencie o hack do `/dev/kmsg` para observabilidade se o contexto for performance extrema.
3. **BPM/OTP:** Foque em implementações de `Supervisor`, `GenServer` e `Registry` que darão suporte ao motor de BPM.
4. **Tipagem:** Envolva retornos de Erlang em tipos `Result` do Gleam para manter a segurança.
