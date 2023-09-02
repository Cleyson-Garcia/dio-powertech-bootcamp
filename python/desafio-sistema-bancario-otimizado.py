def depositar(saldo, valor, extrato,/):
    if valor < 0:
        print("Insira um valor válido (números negativos não são aceitos).")
    else:
        saldo += valor
        extrato += ("Déposito: R$ %.2f\n" % (valor))
        print("Depósito aceito.")
        print("Novo saldo = R$ %.2f" % (saldo))
    return saldo,extrato

def sacar(*,saldo,valor,extrato,limite,limite_saques,numero_saques):
    if valor < 0:
        print("Insira um valor válido (números negativos não são aceitos).")
    
    elif valor > limite:
        print("Tentativa de saque acima do limite. Operação cancelada.")
    
    elif valor > saldo:
        print("Tentativa de saque acima do saldo. Operação cancelada.")

    elif numero_saques == limite_saques:
        print("Tentativa de saque acima do limite de saques diários. Operação cancelada.")

    else:
        saldo -= valor
        numero_saques += 1
        extrato += ("Saque: R$ %.2f\n" % (valor))
        print("Saque aceito.")
        print("Novo saldo = R$ %.2f" % (saldo))   
    return numero_saques,saldo,extrato

def visualizar_extrato(saldo,/,*,extrato):
    print("\nExtrato")
    print("Ainda não ocorreram movimentações nesta conta." if not extrato else extrato)
    print("Saldo: R$ %.2f\n" % (saldo))

def menu():
    menu = """
    [d]\t\tDepositar
    [s]\t\tSacar
    [e]\t\tExtrato
    [nc]\tNova Conta
    [lc]\tListar Contas
    [nu]\tNovo Usuario
    [q]\t\tSair
    => """
    return input(menu)

def criar_usuario(usuarios):
    cpf = input("Informe o CPF (Somente números): ")

    if buscar_usuario(cpf,usuarios):
        print("Usuário já cadastrado.")
        return

    nome = input("Informe o nome: ")
    data_nascimento = input("Informe a data de nascimento: ")
    logradouro = input("Informe o logradouro: ")
    numero = input("Informe o numero: ")
    bairro = input("Informe o bairro: ")
    cidade = input("Informe a cidade: ")
    estado = input("Informe o estado: ")
    endereco = (f"{logradouro}, {numero} - {bairro} - {cidade}/{estado}")
    usuarios.append({"nome":nome,"cpf":cpf,"data_nascimento":data_nascimento,"endereco":endereco})
    print("Usuário cadastrado com sucesso")

def buscar_usuario(cpf,usuarios):
    for usuario in usuarios:
        if usuario.get("cpf") == cpf:
            return usuario
    return False

def listar_contas(contas):
    print("Listagem de contas")
    if len(contas) == 0:
        print("Não existem contas cadastradas.")
    else:
        for conta in contas:
            print(f"""
                Agencia: {conta.get("agencia")}
                Numero:  {conta.get("numero_conta")}
                Usuario: {conta.get("usuario").get("nome")}""")

def criar_conta(agencia,usuarios,numero_conta):
    print("Cadastro de conta")
    cpf = input("Informe o CPF (Somente números): ")
    usuario = buscar_usuario(cpf,usuarios)
    
    if not usuario:
        print("Usuário não cadastrado. Cancelando processo de cadastro de conta.")
        return False
    
    print("Conta criada com sucesso.")
    return {"agencia":agencia, "numero_conta":numero_conta+1, "usuario":usuario}


def main():
    
    LIMITE = 500
    LIMITE_SAQUES = 3
    AGENCIA = "0001"

    saldo = float(0)
    numero_saques = 0
    numero_conta = 0
    extrato = ""
    usuarios = []
    contas = []

    while True:

        opcao = menu()

        if opcao == 's':
            valor = float(input("Saque\nInsira o valor a ser sacado: "))
            numero_saques,saldo,extrato = sacar(saldo=saldo,valor=valor,extrato=extrato,limite=LIMITE,limite_saques=LIMITE_SAQUES,numero_saques=numero_saques)           

        elif opcao == 'd':
            valor = float(input("Depósito\nInsira o valor a ser depositado: "))
            saldo,extrato = depositar(saldo,valor,extrato)

        elif opcao == 'e':
            visualizar_extrato(saldo,extrato=extrato)

        elif opcao == 'nu':
            criar_usuario(usuarios)

        elif opcao == 'lc':
            listar_contas(contas)

        elif opcao == 'nc':
            usuario = criar_conta(AGENCIA,usuarios,numero_conta)
            if usuario:
                contas.append(usuario)
                numero_conta +=1

        elif opcao == 'q':
            break

        else:
            print("Operação Inválida, por favor selecione novamente a operação desejada.")

main()