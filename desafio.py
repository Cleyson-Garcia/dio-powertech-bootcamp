menu = """

[d] Depositar
[s] Sacar
[e] Extrato
[q] Sair

=> """

saldo = float(0)
numero_saques = 0
extrato = ""
LIMITE = 500
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == 's':
        print("Saque")

        valor = float(input("Insira o valor a ser sacado: "))

        if valor < 0:
            print("Insira um valor válido (números negativos não são aceitos).")
        
        elif valor > LIMITE:
            print("Tentativa de saque acima do limite. Operação cancelada.")
        
        elif valor > saldo:
            print("Tentativa de saque acima do saldo. Operação cancelada.")

        elif numero_saques == 3:
            print("Tentativa de saque acima do limite de saques diários. Operação cancelada.")

        else:
            saldo -= valor
            numero_saques += 1
            extrato += ("Saque: R$ %.2f\n" % (valor))
            print("Saque aceito.")
            print("Novo saldo = R$ %.2f" % (saldo))                

    elif opcao == 'd':
        print("Depósito")

        valor = float(input("Insira o valor a ser depositado: "))

        if valor < 0:
            print("Insira um valor válido (números negativos não são aceitos).")
        else:
            saldo += valor
            extrato += ("Déposito: R$ %.2f\n" % (valor))
            print("Depósito aceito.")
            print("Novo saldo = R$ %.2f" % (saldo))

    elif opcao == 'e':
        print("\nExtrato")
        print("Ainda não ocorreram movimentações nesta conta." if not extrato else extrato)
        print("Saldo: R$ %.2f\n" % (saldo))

    elif opcao == 'q':
        break

    else:
        print("Operação Inválida, por favor selecione novamente a operação desejada.")