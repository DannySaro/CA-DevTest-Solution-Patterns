<?xml version="1.0" encoding="UTF-8"?>
<TestCase name="{{TestCaseName}}" version="5">

<meta>
   <create author="n1083" buildNumber="10.2.4.153" date="05/11/2018" host="V40363" version="10.2.4"/>
   <lastEdited author="admin" buildNumber="10.3.0.297" date="09/29/2018" host="SARDA01P5520" version="10.3.0"/>
</meta>

<id>432A25847ACD11E89E4B005056B77D2D</id>
<Documentation>Put documentation of the Test Case here.</Documentation>
<IsInProject>true</IsInProject>
<sig>ZWQ9NSZ0Y3Y9NSZsaXNhdj0xMC4zLjAgKDEwLjMuMC4yOTcpJm5vZGVzPS0xNjU4NTU1MDk0</sig>
<subprocess>false</subprocess>

<initState>
</initState>

<resultState>
</resultState>

<deletedProps>
</deletedProps>

    <Node log="" name="Set Request" next="Subprocess eal_{{enterpriseLayer}}_Call" quiet="true" think="0" type="com.itko.lisa.test.TestNodeLogger" uid="432A4C957ACD11E89E4B005056B77D2D" useFilters="true" version="1"> 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Set Request.rsp</valueToFilterKey>
      <prop>prpRequestPayload</prop>
      </Filter>

<log><![CDATA[{{ReqPayload}}]]></log>
    </Node>


    <Node log="" name="Subprocess eal_{{enterpriseLayer}}_Call" next="Validate Response" quiet="true" think="0H" type="com.itko.lisa.utils.ExecSubProcessNode" uid="4E158F387ACD11E89E4B005056B77D2D" useFilters="true" version="1"> 

<Subprocess>{{LISA_RELATIVE_PROJ_ROOT_protected}}/Tests/Subprocesses/eal_{{enterpriseLayer}}_Call.tst</Subprocess>
<fullyParseProps>false</fullyParseProps>
<sendCommonState>false</sendCommonState>
<getCommonState>false</getCommonState>
<onAbort>abort</onAbort>
<Parameters>
    <Parameter>
    <key>in_RequestPayload</key>
    <value>{{prpRequestPayload}}</value>
    <name>&lt;&lt; description &gt;&gt;</name>
    </Parameter>
</Parameters>
<SaveProps>
<save>out_ResponsePayload</save>
</SaveProps>
    </Node>


    <Node log="" name="Validate Response" next="end" quiet="true" think="0" type="com.itko.lisa.test.TestNodeLogger" uid="37F0B2367ACF11E89E4B005056B77D2D" useFilters="true" version="1"> 

<log>{{out_ResponsePayload}}</log>
{{ResponseAssertions}}

    </Node>


    <Node log="" name="abort" next="" quiet="true" think="0h" type="com.itko.lisa.test.AbortStep" uid="432A4C9C7ACD11E89E4B005056B77D2D" useFilters="true" version="1"> 

    </Node>


    <Node log="" name="fail" next="abort" quiet="true" think="0h" type="com.itko.lisa.test.Abend" uid="432A4C9B7ACD11E89E4B005056B77D2D" useFilters="true" version="1"> 

    </Node>


    <Node log="" name="end" next="fail" quiet="true" think="0h" type="com.itko.lisa.test.NormalEnd" uid="432A4C9A7ACD11E89E4B005056B77D2D" useFilters="true" version="1"> 

    </Node>


</TestCase>