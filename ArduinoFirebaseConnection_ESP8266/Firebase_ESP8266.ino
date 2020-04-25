#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>





// Set these to run example.
#define FIREBASE_HOST "host"
#define FIREBASE_AUTH "auth"
#define WIFI_SSID "netname"
#define WIFI_PASSWORD "pass"

String path = "/nem_sicaklik";


#include <DHTesp.h>

DHTesp dht;

void setup() {
  Serial.begin(9600);
  
dht.setup(D4, DHTesp::DHT11);
  
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}


void loop() {

int hum = dht.getHumidity();

int tem=dht.getTemperature();

Serial.print("Humidity: "); Serial.println(hum);
Serial.print("Temperature: "); Serial.println(tem);

Firebase.setInt( path + "/Temperature/Data", tem);


  if (Firebase.failed()) {
      Serial.print("setting /hum failed:");
      Serial.println(Firebase.error()); 
      }

  Firebase.setInt(path + "/Humidity/Data", hum);
  if (Firebase.failed()) {
      Serial.print("setting /tem failed:");
      Serial.println(Firebase.error());  
  }

  


  
  
  }
