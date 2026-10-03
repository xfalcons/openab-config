
Q: Got Internal Error (code: -32603) in Codex
A: Update model to gpt-5.3-codex. 我的經驗是 node memory pressure, cli sub process 被kernel 砍掉，那個thread (session) 就會 return 32603，把mem request 調高，或換一個mem 比較大的node 就不太會遇到這問題. 我剛剛也是掛了 我reset token也不行,
然後我用/model 把原本 gpt 5.2 換 5.4 就正常了



