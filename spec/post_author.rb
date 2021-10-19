require "httparty"

describe "POST /Authors" do
  it "Cadastro de autor com sucesso" do

    #Criação de um Payload para envio do Corpo da mensagem do POST
    payload = {
        id: 1000,
        idBook: 250,
        firstName: "Jeremias",
        lastName: "Araújo"
     }


    #Envio de requisição ao Endpoint POST do /Authors e guardando o retorno na variável "response"
    response = HTTParty.post(
      "http://fakerestapi.azurewebsites.net/api/v1/Authors",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )

    #SYSOUT PRINT - Imprime no console


    #Validação do código de retorno da API de POST /Authors como sucesso (200)
    expect(response.code).to eql 200

    #Transformando a variavel de retorno em um Hash, para facilitar o trabalho de validaão
    response_parsed = response.parsed_response

    #Validando o ID do Author cadastrado é exatamente retornado no response.body
    expect(response_parsed["id"]).to eql 1000

    expect(response_parsed["idBook"]).to eql 250

    expect(response_parsed["firstName"]).to eql "Jeremias"

    expect(response_parsed["lastName"]).to eql "Araújo"

  end
end
