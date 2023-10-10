// Declarando Bibliotecas dos Sensores

    #include <Adafruit_Sensor.h>
    #include <DHT.h>
    #include <DHT_U.h>
    #include "DHT.h"

// Define a porta de cada Sensor

  #define DHTPIN A2
  #define LM35PIN A4
  #define LUMIPIN A0
  #define CHAVPIN 7

// Informa os parâmetros do sensor para de acordo com os disponíveis na biblioteca

  DHT dht(DHTPIN, DHT11);

// Função que estabelece a conexão entre a placa e o computador

void setup() {

  // Setamos o tipo de conexão na porta
  pinMode(DHTPIN, INPUT);
  pinMode(CHAVPIN, INPUT);

  //Estabelecemos a velocidade de comunicação
  Serial.begin(9600);

  //Função da API do DHT
  dht.begin();
}

// Função de Loop para captura dos dados contínuo
void loop() {

  // Declarando as variáveis que estão armazenando os dados captados
  float dht11_umidade = dht.readHumidity();
  float dht11_temperatura = dht.readTemperature();
  float luminosidade = analogRead(LUMIPIN);
  float lm35_temperatura = analogRead(LM35PIN);
  int chave = digitalRead(7);
  lm35_temperatura = lm35_temperatura * 0.00488;
  lm35_temperatura = lm35_temperatura * 100;

  // Imprimindo valores capturados
  Serial.print(dht11_umidade);
  Serial.print(";");
  Serial.print(dht11_temperatura);
  Serial.print(";");
  Serial.print(luminosidade);
  Serial.print(";");
  Serial.print(lm35_temperatura);
  Serial.print(";");
  if (chave == 0) {
    Serial.print("1");
  } else {
    Serial.print("0");
  }
  Serial.println();
  delay(2000);
}