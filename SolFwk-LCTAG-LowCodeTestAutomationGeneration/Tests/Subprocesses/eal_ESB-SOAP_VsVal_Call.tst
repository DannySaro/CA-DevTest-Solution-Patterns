<?xml version="1.0" ?>

<TestCase name="eal_ESB-SOAP_VsVal_Call" version="5">

<meta>
   <create version="10.2.4" buildNumber="10.2.4.153" author="n1083" date="05/11/2018" host="V40363" />
   <lastEdited version="10.3.0" buildNumber="10.3.0.297" author="admin" date="01/25/2019" host="SARDA01P5520" />
</meta>

<id>DA2050420B211E9B9AB005056C00001</id>
<Documentation>Put documentation of the Test Case here.</Documentation>
<IsInProject>true</IsInProject>
<sig>ZWQ9NSZ0Y3Y9NSZsaXNhdj0xMC4zLjAgKDEwLjMuMC4yOTcpJm5vZGVzPTEzNzk5OTczMjk=</sig>
<subprocess>true</subprocess>

<initState>
    <Parameter>
    <key>in_RequestPayload</key>
    <value>&lt;&lt; default value &gt;&gt;</value>
    <name>&lt;&lt; description &gt;&gt;</name>
    </Parameter>
</initState>

<resultState>
    <Parameter>
    <key>out_ResponsePayload</key>
    <value></value>
    <name>Set in eal_ESB-SOAP_Call step</name>
    </Parameter>
    <Parameter>
    <key>out_VirtualResponsePayload</key>
    <value></value>
    <name>Set in eal_ESB-SOAP_Virtual_Call step</name>
    </Parameter>
</resultState>

<deletedProps>
    <key>prp_location</key>
    <key>lisa.JMS Send Receive.rsp.time</key>
    <key>lisa.eal_ESB-SOAP_Call.rsp</key>
    <key>BsaEndpoint</key>
    <key>prp_LOB_Name</key>
    <key>dbUserId</key>
    <key>prp_userId</key>
    <key>dbQualifier</key>
    <key>TestsOutputDirectory</key>
    <key>lisa.Filter Request Payload.rsp</key>
    <key>lisa.Override User Session Info.rsp</key>
    <key>someNeededProperty</key>
    <key>lisa.eal_ESB-SOAP_Call.rsp.time</key>
    <key>lisa.eal_ESB-SOAP_Call~1.rsp</key>
    <key>lisa.JMS Send Receive.rsp</key>
    <key>{{prp_Request_Payload_next}}</key>
    <key>lisa.SessionTable.rsp</key>
    <key>lisa.Web Service.rsp.time</key>
    <key>lisa.Output Log Message.rsp.time</key>
    <key>lisa.eal_ESB-SOAP_Virtual_Call.rsp.time</key>
    <key>prp_taskCode</key>
    <key>dbConnectString</key>
    <key>WSSERVER</key>
    <key>lisa.Override User Session Info.rsp.time</key>
    <key>prp_operationCode</key>
    <key>lisa.eal_ESB-SOAP_Call~1.rsp.time</key>
    <key>lisa.SessionTable.rsp.time</key>
    <key>lisa.Queue and Sublob.rsp</key>
    <key>eal_ESB-SOAP_Endpoint</key>
    <key>ExcelDataFile</key>
    <key>ExcelDataDirectory</key>
    <key>prp_Queue_Name</key>
    <key>lisa.Output Log Message.rsp</key>
    <key>prp_channelCode</key>
    <key>lisa.eal_ESB-SOAP_Virtual_Call.rsp</key>
    <key>WSPORT</key>
    <key>prp_opUniqueId</key>
    <key>enterpriseLayer</key>
    <key>prp_restReq</key>
    <key>lisa.Filter Request Payload.rsp.time</key>
    <key>lisa.Queue and Sublob.rsp.time</key>
    <key>lisa.Web Service.rsp</key>
    <key>dbPassword</key>
</deletedProps>

    <Node name="Filter Request Payload" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="DA2050520B211E9B9AB005056C00001" 
          think="0" 
          useFilters="true" 
          quiet="true" 
          next="eal_ESB-SOAP_Call" > 

<log>{{in_RequestPayload}}</log>
    </Node>


    <Node name="eal_ESB-SOAP_Call" log=""
          type="com.itko.lisa.ws.nx.NxWSStep" 
          version="1" 
          uid="DA2050620B211E9B9AB005056C00001" 
          think="0" 
          useFilters="true" 
          quiet="false" 
          next="eal_ESB-SOAP_Virtual_Call" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.eal_ESB-SOAP_Call.rsp</valueToFilterKey>
      <prop>out_ResponsePayload</prop>
      </Filter>

<endpoint>{{eal_ESB-SOAP_Endpoint}}</endpoint>
<onError>abort</onError>
<maintainSession>true</maintainSession>
<clearSession>false</clearSession>
<request itko_enc="base64">e3tpbl9SZXF1ZXN0UGF5bG9hZH19</request>
<style>document</style>
<use>literal</use>
<sslInfo>
<ssl-keystore-password-enc>l13527f2bd21b28e81789e49c410d4cf38a57a96b146eff92e438088e87888157</ssl-keystore-password-enc>
<ssl-key-password-enc>l5be896c422784ce6225c36d91ffcb9242c60a86bd32e81149e8f6b636df3acaa</ssl-key-password-enc>
</sslInfo>
<wsiInfo>
<wsi-check-wsdl>false</wsi-check-wsdl>
<wsi-check-msg>false</wsi-check-msg>
<wsi-display-type>onlyFailed</wsi-display-type>
<wsi-on-fail>continue</wsi-on-fail>
</wsiInfo>
<transport>
<soapVersionUri>1.1</soapVersionUri>
<httpVersionUri>1.1</httpVersionUri>
<webMethodUri>POST</webMethodUri>
<mtom>false</mtom>
<dontSendRequest>false</dontSendRequest>
<fault-as-error>true</fault-as-error>
<callTimeout>30000</callTimeout>
</transport>
<uddiActive>false</uddiActive>
<uddi-result>
<uddi-selection>
</uddi-selection>
</uddi-result>
<wss4jInfo>
<version>5</version>
<wssecurity>
<isSend>true</isSend>
<must>false</must>
</wssecurity>
<wsi-bsp>false</wsi-bsp>
</wss4jInfo>
<wsaInfo>
<useAddressing>false</useAddressing>
<must>false</must>
<to></to>
<toOverride>false</toOverride>
<toDefault>true</toDefault>
<from></from>
<fromOverride>false</fromOverride>
<fromDefault>true</fromDefault>
<action></action>
<actionOverride>false</actionOverride>
<actionDefault>true</actionDefault>
<msgid></msgid>
<msgidOverride>false</msgidOverride>
<msgidDefault>true</msgidDefault>
<replyTo></replyTo>
<replyToOverride>false</replyToOverride>
<faultTo></faultTo>
<faulttToOverride>false</faulttToOverride>
<addressingVersion>http://www.w3.org/2005/08/addressing</addressingVersion>
</wsaInfo>
<customHTTPHeaderInfo>
</customHTTPHeaderInfo>
<attachments>
<attachment-type>MIME</attachment-type>
</attachments>
<mtom-paths>
</mtom-paths>
    </Node>


    <Node name="eal_ESB-SOAP_Virtual_Call" log=""
          type="com.itko.lisa.ws.nx.NxWSStep" 
          version="1" 
          uid="805BFB7220B211E9B9AB005056C00001" 
          think="0" 
          useFilters="true" 
          quiet="false" 
          next="end" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.eal_ESB-SOAP_Virtual_Call.rsp</valueToFilterKey>
      <prop>out_VirtualResponsePayload</prop>
      </Filter>

<wsdl></wsdl>
<endpoint>{{eal_ESB-SOAP_Virtual_Endpoint}}</endpoint>
<targetNamespace></targetNamespace>
<service></service>
<port></port>
<operation></operation>
<onError>abort</onError>
<maintainSession>true</maintainSession>
<clearSession>false</clearSession>
<request itko_enc="base64">e3tpbl9SZXF1ZXN0UGF5bG9hZH19</request>
<style>document</style>
<use>literal</use>
<soapAction></soapAction>
<sslInfo>
<ssl-keystore-file></ssl-keystore-file>
<ssl-keystore-password-enc>lbb257b35455954c61a23799732de0c8ff12994406b80606d107f41b3a7115b19</ssl-keystore-password-enc>
<ssl-alias></ssl-alias>
<ssl-key-password-enc>lce571baf14e259e8430393ae27e6362f727cdd3f7995a58b10edc5ecda889f34</ssl-key-password-enc>
</sslInfo>
<wsiInfo>
<wsi-check-wsdl>false</wsi-check-wsdl>
<wsi-check-msg>false</wsi-check-msg>
<wsi-display-type>onlyFailed</wsi-display-type>
<wsi-on-fail>continue</wsi-on-fail>
</wsiInfo>
<transport>
<soapVersionUri>1.1</soapVersionUri>
<httpVersionUri>1.1</httpVersionUri>
<webMethodUri>POST</webMethodUri>
<mtom>false</mtom>
<dontSendRequest>false</dontSendRequest>
<fault-as-error>true</fault-as-error>
<callTimeout>30000</callTimeout>
</transport>
<uddiActive>false</uddiActive>
<uddi-result>
<uddi-selection>
</uddi-selection>
</uddi-result>
<wss4jInfo>
<version>5</version>
<wssecurity>
<isSend>true</isSend>
<must>false</must>
<role></role>
</wssecurity>
<wsi-bsp>false</wsi-bsp>
</wss4jInfo>
<wsaInfo>
<useAddressing>false</useAddressing>
<must>false</must>
<to></to>
<toOverride>false</toOverride>
<toDefault>true</toDefault>
<from></from>
<fromOverride>false</fromOverride>
<fromDefault>true</fromDefault>
<action></action>
<actionOverride>false</actionOverride>
<actionDefault>true</actionDefault>
<msgid></msgid>
<msgidOverride>false</msgidOverride>
<msgidDefault>true</msgidDefault>
<replyTo></replyTo>
<replyToOverride>false</replyToOverride>
<faultTo></faultTo>
<faulttToOverride>false</faulttToOverride>
<addressingVersion>http://www.w3.org/2005/08/addressing</addressingVersion>
</wsaInfo>
<customHTTPHeaderInfo>
</customHTTPHeaderInfo>
<attachments>
<attachment-type>MIME</attachment-type>
</attachments>
<mtom-paths>
</mtom-paths>
    </Node>


    <Node name="abort" log=""
          type="com.itko.lisa.test.AbortStep" 
          version="1" 
          uid="DA2050920B211E9B9AB005056C00001" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="" > 

    </Node>


    <Node name="fail" log=""
          type="com.itko.lisa.test.Abend" 
          version="1" 
          uid="DA2050820B211E9B9AB005056C00001" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="abort" > 

    </Node>


    <Node name="end" log=""
          type="com.itko.lisa.test.NormalEnd" 
          version="1" 
          uid="DA2050720B211E9B9AB005056C00001" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="fail" > 

    </Node>


</TestCase>
