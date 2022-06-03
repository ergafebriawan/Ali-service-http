#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <WiFi.h>
//#include <WiFiCLient.h>

HTTPClient http;
WiFiClient client;

const char* ssid = "IT Office New";
const char* password = "Saygon13";

String serverName = "http://192.168.0.111:5000";
unsigned long lastTime = 0;
unsigned long timerDelay = 5000;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

  WiFi.begin(ssid, password);
  connectingToNetwork();

}

void loop() {
  if ((millis() - lastTime) > timerDelay) {
    checkConnectNetwork();
    Serial.println("running...");
    postData(18, 0, "123809241312434");
    delay(5000);
    lastTime = millis();
  }
}

boolean checkConnectNetwork() {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("Network Disconnected");
    connectingToNetwork();
  } else {
    return true;
  }
}


void connectingToNetwork() {
  Serial.println("Connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi Network with IP Address:");
  Serial.println(WiFi.localIP());
}

void getData() {
  String serverPath = serverName + "/get_report";
  http.begin(serverPath.c_str());
  http.GET();
  DynamicJsonDocument doc(2048);
  deserializeJson(doc, http.getString());
  String item = doc["data"];
  Serial.println(item);
  //  Serial.println(http.getString());
  http.end();
}

void postData(int ketinggian, int pintu, String gps) {
  String serverPath = serverName + "/add_report";
  
  DynamicJsonDocument doc(2048);
  doc["ketinggian"] = ketinggian;
  doc["pintu"] = pintu;
  doc["gps"] = gps;
  
  String json;
  serializeJson(doc, json);
  
  http.begin(client, serverPath.c_str());
  http.addHeader("Content-Type", "application/json");
  http.POST(json);
//  Serial.println(http.getString());

  DynamicJsonDocument doc2(2048);
  deserializeJson(doc2, http.getString());
  Serial.println(doc["message"]);
  http.end();
}
