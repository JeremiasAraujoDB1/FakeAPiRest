require "httparty"

describe "GET /Authors" do
  it "Consulta da lista de Autores" do
    #Envio de requisição ao Endpoint GET do /Authors e guardando o retorno na variável "response".
    response = HTTParty.get(
      "http://fakerestapi.azurewebsites.net/api/v1/Authors",
      headers: {
        "Content-Type": "application/json",
      },    
    )
    puts "RESPONSE: #{response}"

    #Validação do código de retorno da API de GEY /Authors como sucesso (200)
    expect(response.code).to eql 200
  end

  
  it  "Validando tamanho da lista de Autores" do
      response = HTTParty.get(
        "http://fakerestapi.azurewebsites.net/api/v1/Authors",
        headers: {
          "Content-Type": "application/json",
        },
      )
      
      #Transformando a variavel de retorno em um Hash, para facilitar o trabalho de validaão
      response_parsed = response.parsed_response

      puts "RESPONSE PARSED: #{response_parsed}"

      #Validando que a lista de autores tem 589 elementos
      expect(response_parsed.size).to be > 0
  end
end
