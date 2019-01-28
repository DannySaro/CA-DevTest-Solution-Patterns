<?xml version="1.0" ?>

<TestCase name="CreateTestsV3" version="5">

<meta>
   <create version="10.2.4" buildNumber="10.2.4.153" author="n1083" date="09/11/2018" host="V40363" />
   <lastEdited version="10.3.0" buildNumber="10.3.0.297" author="admin" date="12/26/2018" host="SARDA01P5520" />
</meta>

<id>6103DBFB050C11E99CCD005056C00001</id>
<Documentation>Put documentation of the Test Case here.</Documentation>
<IsInProject>true</IsInProject>
<sig>ZWQ9NSZ0Y3Y9NSZsaXNhdj0xMC4zLjAgKDEwLjMuMC4yOTcpJm5vZGVzPS0xNTc4NjM4NTgy</sig>
<subprocess>false</subprocess>

<initState>
</initState>

<resultState>
</resultState>

<deletedProps>
</deletedProps>

    <Node name="Prepare Test MetaData" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="6104030C050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Read file Request Xml" > 


      <!-- Data Sets -->
<readrec>Test Specification</readrec>
<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Read file Request Xml" log=""
          type="com.itko.lisa.test.FileNode" 
          version="1" 
          uid="6104030D050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Read file Framework Xml" > 

<Loc>{{ExcelDataDirectory}}{{RequestPayloadFileName}}</Loc>
<charset>DEFAULT</charset>
<PropKey>ReqPayload</PropKey>
<onFail>abort</onFail>
    </Node>


    <Node name="Read file Framework Xml" log=""
          type="com.itko.lisa.test.FileNode" 
          version="1" 
          uid="6104030E050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Read file TestTemplate.tst" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Read file Framework Xml.rsp</valueToFilterKey>
<prop>RspAssertionSetNbr</prop>
<xpathq>count(/framework/validations)</xpathq>
      </Filter>

      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Read file Framework Xml.rsp</valueToFilterKey>
<prop>RspFilterSetNbr</prop>
<xpathq>count(/framework/filters)</xpathq>
      </Filter>

      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Read file Framework Xml.rsp</valueToFilterKey>
<prop>TemplateName</prop>
<xpathq>/framework/templatename/text()</xpathq>
<nsMap0>=</nsMap0>
      </Filter>

<Loc>{{ExcelDataDirectory}}{{TestSpecificationFileName}}</Loc>
<charset>DEFAULT</charset>
<PropKey>FrameworkPayload</PropKey>
<onFail>abort</onFail>
    </Node>


    <Node name="Read file TestTemplate.tst" log=""
          type="com.itko.lisa.test.FileNode" 
          version="1" 
          uid="6104030F050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Check if Assertion Sets" > 

<Loc>{{LISA_RELATIVE_PROJ_ROOT}}/Tests/Templates/{{TemplateName}}.tst</Loc>
<charset>DEFAULT</charset>
<PropKey>TestTemplate</PropKey>
<onFail>abort</onFail>
    </Node>


    <Node name="Check if Assertion Sets" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="585FE4E206B411E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Get Current Assertion Set" > 


      <!-- Assertions -->
<CheckResult assertTrue="true" name="If RspAssertionSetNbr == 0" type="com.itko.lisa.test.CheckResultPropRegEx">
<log>Assertion name: If RspAssertionSetNbr == 0 checks for: true is of type: Property Value Expression.</log>
<then>All Assertion Sets Done</then>
<valueToAssertKey></valueToAssertKey>
        <prop>RspAssertionSetNbr</prop>
        <param>0</param>
</CheckResult>

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Get Current Assertion Set" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="C91DEB4906B111E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Process AssertionSet Payload" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>FrameworkPayload</valueToFilterKey>
<prop>AssertionSetPayload</prop>
<xpathq>/framework/validations[{{CurrentAssertionSetNbr}}]</xpathq>
<nsMap0>=</nsMap0>
      </Filter>


      <!-- Data Sets -->
<readrec>CurrentAssertionSetNbr</readrec>
<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Process AssertionSet Payload" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="1E90EAF08EE11E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Initialize Response Assertion Set" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Process AssertionSet Payload.rsp</valueToFilterKey>
<prop>RspAssertionParamNbr</prop>
<xpathq>count(/validations/validation)</xpathq>
<nsMap0>=</nsMap0>
      </Filter>

      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Process AssertionSet Payload.rsp</valueToFilterKey>
<prop>AssertionName</prop>
<xpathq>/validations/@name</xpathq>
<nsMap0>=</nsMap0>
      </Filter>

<log>{{AssertionSetPayload}}</log>
    </Node>


    <Node name="Initialize Response Assertion Set" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040310050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Identify Validation Type" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Initialize Response Assertion Set.rsp</valueToFilterKey>
      <prop>ResponseAssertionSet</prop>
      </Filter>


      <!-- Assertions -->
<CheckResult assertTrue="true" name="If RspAssertionParamNbr == 0" type="com.itko.lisa.test.CheckResultPropRegEx">
<log>Assertion name: If RspAssertionParamNbr == 0 checks for: true is of type: Property Value Expression.</log>
<then>Store Current Assertion Set</then>
<valueToAssertKey></valueToAssertKey>
        <prop>RspAssertionParamNbr</prop>
        <param>0</param>
</CheckResult>

<log>&lt;!-- Assertions {{AssertionName}} --&gt;</log>
    </Node>


    <Node name="Identify Validation Type" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040311050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Read file Validation Template .tst" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Identify Validation Type.rsp</valueToFilterKey>
<prop>AssertionType</prop>
<xpathq>/framework/validations/validation[{{AssertionParamNbr}}]/type/text()</xpathq>
      </Filter>


      <!-- Data Sets -->
<readrec>AssertionParamNbr</readrec>
<log>{{FrameworkPayload}}</log>
    </Node>


    <Node name="Read file Validation Template .tst" log=""
          type="com.itko.lisa.test.FileNode" 
          version="1" 
          uid="61040312050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Compare Strings for Next Step Lookup" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Read file Validation Template .tst.rsp</valueToFilterKey>
      <prop>AssertionString</prop>
      </Filter>

<Loc>{{LISA_RELATIVE_PROJ_ROOT}}/Tests/Templates/Assertion_{{AssertionType}}.tst</Loc>
<charset>DEFAULT</charset>
<PropKey></PropKey>
<onFail>abort</onFail>
    </Node>


    <Node name="Compare Strings for Next Step Lookup" log=""
          type="com.itko.lisa.vse.StepSelectorStep" 
          version="1" 
          uid="61040313050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="abort" > 

<control>{{AssertionType}}</control>
<start></start>
<end></end>
<noMatchStep>abort</noMatchStep>
<onExceptionStep>abort</onExceptionStep>
<table>
<Case>
<enabled>true</enabled>
<name>Result Contains String</name>
<delay>0</delay>
<criteria>ResultContainsString.*</criteria>
<compareType>REGEX</compareType>
<nextStep>Retrieve ResultContainsString Validation Data</nextStep>
</Case>
<Case>
<enabled>true</enabled>
<name>Ensure Properties Are Equal</name>
<delay>0</delay>
<criteria>EnsurePropertiesAreEqual.*</criteria>
<compareType>REGEX</compareType>
<nextStep>Retrieve EnsurePropertiesAreEqual Validation Data</nextStep>
</Case>
</table>
    </Node>


    <Node name="Retrieve ResultContainsString Validation Data" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040314050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Concatenate Assertion" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Retrieve ResultContainsString Validation Data.rsp</valueToFilterKey>
<prop>AssertionData</prop>
<xpathq>/validations/validation[{{AssertionParamNbr}}]/containsString/text()</xpathq>
      </Filter>

<log>{{AssertionSetPayload}}</log>
    </Node>

    <Node name="Retrieve EnsurePropertiesAreEqual Validation Data" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040314050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Concatenate Assertion" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Retrieve EnsurePropertiesAreEqual Validation Data.rsp</valueToFilterKey>
<prop>AssertionProperty1</prop>
<xpathq>/validations/validation[{{AssertionParamNbr}}]/property1/text()</xpathq>
      </Filter>

      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Retrieve EnsurePropertiesAreEqual Validation Data.rsp</valueToFilterKey>
<prop>AssertionProperty2</prop>
<xpathq>/validations/validation[{{AssertionParamNbr}}]/property2/text()</xpathq>
      </Filter>
	  
	  
<log>{{AssertionSetPayload}}</log>
    </Node>


    <Node name="Concatenate Assertion" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040315050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Identify Validation Type" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Concatenate Assertion.rsp</valueToFilterKey>
      <prop>ResponseAssertionSet</prop>
      </Filter>

<log>{{ResponseAssertionSet}}&#13;&#10;{{AssertionString}}</log>
    </Node>


    <Node name="All Assertion Sets Done" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="5C8D9D4C06B611E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Check if Filter Sets" > 

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Check if Filter Sets" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="EF09C4D106B611E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Get Current Filter Set" > 


      <!-- Assertions -->
<CheckResult assertTrue="true" name="If RspFilterSetNbr == 0" type="com.itko.lisa.test.CheckResultPropRegEx">
<log>Assertion name: If RspAssertionSetNbr == 0 checks for: true is of type: Property Value Expression.</log>
<then>All Filter Sets Done</then>
<valueToAssertKey></valueToAssertKey>
        <prop>RspFilterSetNbr</prop>
        <param>0</param>
</CheckResult>

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Get Current Filter Set" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="C91DEB4906B111E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Process FilterSet Payload" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>FrameworkPayload</valueToFilterKey>
<prop>FilterSetPayload</prop>
<xpathq>/framework/filters[{{CurrentFilterSetNbr}}]</xpathq>
<nsMap0>=</nsMap0>
      </Filter>


      <!-- Data Sets -->
<readrec>CurrentFilterSetNbr</readrec>
<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Process FilterSet Payload" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="1E90EAF08EE11E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Initialize Response Filter Set" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Process FilterSet Payload.rsp</valueToFilterKey>
<prop>RspFilterParamNbr</prop>
<xpathq>count(/filters/filter)</xpathq>
<nsMap0>=</nsMap0>
      </Filter>

      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Process FilterSet Payload.rsp</valueToFilterKey>
<prop>FilterName</prop>
<xpathq>/filters/@name</xpathq>
      </Filter>

<log>{{FilterSetPayload}}</log>
    </Node>


    <Node name="Initialize Response Filter Set" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040310050C11E99CCD005056C00001" 
          think="0" 
          useFilters="true" 
          quiet="true" 
          next="Identify Filter Type" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Initialize Response Filter Set.rsp</valueToFilterKey>
      <prop>ResponseFilterSet</prop>
      </Filter>


      <!-- Assertions -->
<CheckResult assertTrue="true" name="If RspFilterParamNbr == 0" type="com.itko.lisa.test.CheckResultPropRegEx">
<log>Assertion name: If RspFilterParamNbr == 0 checks for: true is of type: Property Value Expression.</log>
<then>Store Current Filter Set</then>
<valueToAssertKey></valueToAssertKey>
        <prop>RspFilterParamNbr</prop>
        <param>0</param>
</CheckResult>

<log>&lt;!-- Filters {{FilterName}} --&gt;</log>
    </Node>


    <Node name="Identify Filter Type" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040311050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Read file Filter Template .tst" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Identify Filter Type.rsp</valueToFilterKey>
<prop>FilterType</prop>
<xpathq>/framework/filters[{{CurrentFilterSetNbr}}]/filter[{{FilterParamNbr}}]/type/text()</xpathq>
      </Filter>


      <!-- Data Sets -->
<readrec>FilterParamNbr</readrec>
<log>{{FrameworkPayload}}</log>
    </Node>


    <Node name="Read file Filter Template .tst" log=""
          type="com.itko.lisa.test.FileNode" 
          version="1" 
          uid="61040312050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Compare Filter Strings for Next Step Lookup" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Read file Filter Template .tst.rsp</valueToFilterKey>
      <prop>FilterString</prop>
      </Filter>

<Loc>{{LISA_RELATIVE_PROJ_ROOT}}/Tests/Templates/Filter_{{FilterType}}.tst</Loc>
<charset>DEFAULT</charset>
<PropKey></PropKey>
<onFail>abort</onFail>
    </Node>


    <Node name="Compare Filter Strings for Next Step Lookup" log=""
          type="com.itko.lisa.vse.StepSelectorStep" 
          version="1" 
          uid="61040313050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="abort" > 

<control>{{FilterType}}</control>
<start></start>
<end></end>
<noMatchStep>abort</noMatchStep>
<onExceptionStep>abort</onExceptionStep>
<table>
<Case>
<enabled>true</enabled>
<name>XML XPath</name>
<delay>0</delay>
<criteria>XMLXPath.*</criteria>
<compareType>REGEX</compareType>
<nextStep>Retrieve XMLXPath Filter Data</nextStep>
</Case>
<Case>
<enabled>true</enabled>
<name>JSON JPath</name>
<delay>0</delay>
<criteria>JSONJPath</criteria>
<compareType>FIND</compareType>
<nextStep>abort</nextStep>
</Case>
</table>
    </Node>


    <Node name="Retrieve XMLXPath Filter Data" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040314050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Concatenate Filter" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.xml.FilterXMLXPath">
        <valueToFilterKey>lisa.Retrieve XMLXPath Filter Data.rsp</valueToFilterKey>
<prop>FilterData</prop>
<xpathq>/filters/filter[{{FilterParamNbr}}]/xpathq/text()</xpathq>
      </Filter>

<log>{{FilterSetPayload}}</log>
    </Node>


    <Node name="Concatenate Filter" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040315050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Identify Filter Type" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Concatenate Filter.rsp</valueToFilterKey>
      <prop>ResponseFilterSet</prop>
      </Filter>

<log>{{ResponseFilterSet}}&#13;&#10;{{FilterString}}</log>
    </Node>


    <Node name="Store Current Assertion Set" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="2EA4890E06B611E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Current Assertion Set Done" > 


      <!-- Assertions -->
<CheckResult assertTrue="false" name="Store under AssertionSet Name" type="com.itko.lisa.test.AssertByScript">
<log>Assertion name: Store under AssertionSet Name checks for: false is of type: Assert by Script Execution.</log>
<then>fail</then>
<valueToAssertKey></valueToAssertKey>
        <script>// This script should return a boolean result indicating the assertion is true or false&#13;&#10;// This script should return a boolean result indicating the assertion is true or false&#13;&#10;&#13;&#10;testExec.setStateValue(testExec.getStateValue(&quot;AssertionName&quot;), testExec.getStateValue(&quot;ResponseAssertionSet&quot;));&#13;&#10;return true;</script>
        <language>BeanShell</language>
        <copyprops>TestExecPropsAndSystemProps</copyprops>
</CheckResult>

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Current Assertion Set Done" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="FD4D708608EE11E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Get Current Assertion Set" > 

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="All Filter Sets Done" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="4991BBF506B711E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Resolve TestCase" > 

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Resolve TestCase" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="61040316050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Write TestCase" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Resolve TestCase.rsp</valueToFilterKey>
      <prop>ResolvedTestCase</prop>
      </Filter>

<log>{{TestTemplate}}</log>
    </Node>


    <Node name="Write TestCase" log=""
          type="com.itko.lisa.test.UserScriptNode" 
          version="1" 
          uid="61040317050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="false" 
          next="Prepare Test MetaData" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSavePropToFile">
        <valueToFilterKey>lisa.Write TestCase.rsp</valueToFilterKey>
      <file>{{TestsOutputDirectory}}/{{TestCaseName}}.tst</file>
      <append>false</append>
      </Filter>


      <!-- Assertions -->
<CheckResult assertTrue="true" name="Any Exception Then Fail" type="com.itko.lisa.dynexec.CheckInvocationEx">
<log>Assertion name: Any Exception Then Fail checks for: true is of type: Assert on Invocation Exception.</log>
<then>fail</then>
<valueToAssertKey></valueToAssertKey>
        <param>.*</param>
</CheckResult>

<onerror>abort</onerror>
<language>BeanShell</language>
<copyProps>TestExecProps</copyProps>
<script>//&#13;&#10;&#13;&#10;String strTestCase = testExec.getStateValue(&quot;ResolvedTestCase&quot;);&#13;&#10;return strTestCase.replaceAll(&quot;_protected}}&quot;,&quot;}}&quot;).replaceAll(&quot;_protected&lt;&quot;,&quot;&lt;&quot;);</script>
    </Node>


    <Node name="Store Current Filter Set" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="2EA4890E06B611E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Current Filter Set Done" > 


      <!-- Assertions -->
<CheckResult assertTrue="false" name="Store under FilterSet Name" type="com.itko.lisa.test.AssertByScript">
<log>Assertion name: Store under FilterSet Name checks for: false is of type: Assert by Script Execution.</log>
<then>fail</then>
<valueToAssertKey></valueToAssertKey>
        <script>// This script should return a boolean result indicating the assertion is true or false&#13;&#10;// This script should return a boolean result indicating the assertion is true or false&#13;&#10;&#13;&#10;testExec.setStateValue(testExec.getStateValue(&quot;FilterName&quot;), testExec.getStateValue(&quot;ResponseFilterSet&quot;));&#13;&#10;return true;</script>
        <language>BeanShell</language>
        <copyprops>TestExecPropsAndSystemProps</copyprops>
</CheckResult>

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Current Filter Set Done" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="2BE8330A06B711E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Get Current Filter Set" > 

<log>Provide logging info here.  Use of properties is fine in {{ }} notation.</log>
    </Node>


    <Node name="Define Filter Save Property Name" log=""
          type="com.itko.lisa.test.TestNodeLogger" 
          version="1" 
          uid="2FFAB930054A11E98BF3005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="true" 
          next="Read file Filter Template .tst" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Define Filter Save Property Name.rsp</valueToFilterKey>
      <prop>FilterName</prop>
      </Filter>

<log>Set1Filter{{FilterParamNbr}}</log>
    </Node>


    <Node name="Set Property AssertionData" log=""
          type="com.itko.lisa.test.UserScriptNode" 
          version="1" 
          uid="61040318050C11E99CCD005056C00001" 
          think="500-1S" 
          useFilters="true" 
          quiet="false" 
          next="abort" > 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.FilterSaveResponse">
        <valueToFilterKey>lisa.Set Property AssertionData.rsp</valueToFilterKey>
      <prop>AssertionData</prop>
      </Filter>


      <!-- Assertions -->
<CheckResult assertTrue="true" name="Any Exception Then Fail" type="com.itko.lisa.dynexec.CheckInvocationEx">
<log>Assertion name: Any Exception Then Fail checks for: true is of type: Assert on Invocation Exception.</log>
<then>fail</then>
<valueToAssertKey></valueToAssertKey>
        <param>.*</param>
</CheckResult>

<onerror>abort</onerror>
<language>BeanShell</language>
<copyProps>TestExecProps</copyProps>
<script>return testExec.getStateValue(&quot;RspAssertionData&quot; + testExec.getStateValue(&quot;AssertionParamNbr&quot;));</script>
    </Node>


    <Node name="abort" log=""
          type="com.itko.lisa.test.AbortStep" 
          version="1" 
          uid="6104031B050C11E99CCD005056C00001" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="" > 

    </Node>


    <Node name="fail" log=""
          type="com.itko.lisa.test.Abend" 
          version="1" 
          uid="6104031A050C11E99CCD005056C00001" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="abort" > 

    </Node>


    <Node name="end" log=""
          type="com.itko.lisa.test.NormalEnd" 
          version="1" 
          uid="61040319050C11E99CCD005056C00001" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="fail" > 

    </Node>


    <DataSet type="com.itko.lisa.test.ExcelDataFile" name="Test Specification" atend="end" local="true" random="false" maxItemsToFetch="100" >
<sample>rO0ABXNyABFqYXZhLnV0aWwuSGFzaE1hcAUH2sHDFmDRAwACRgAKbG9hZEZhY3RvckkACXRocmVzaG9sZHhwP0AAAAAAAAB3CAAAABAAAAAAeA==</sample>
    <location>{{ExcelDataFile}}</location>
    <sheetname>Sheet1</sheetname>
    </DataSet>

    <DataSet type="com.itko.lisa.test.CounterDataSet" name="AssertionParamNbr" atend="Store Current Assertion Set" local="true" random="false" maxItemsToFetch="0" >
<sample>rO0ABXNyABFqYXZhLnV0aWwuSGFzaE1hcAUH2sHDFmDRAwACRgAKbG9hZEZhY3RvckkACXRocmVzaG9sZHhwP0AAAAAAAAB3CAAAABAAAAAAeA==</sample>
    <propKey>AssertionParamNbr</propKey>
    <countFrom>1</countFrom>
    <countTo>{{RspAssertionParamNbr}}</countTo>
    <countIncrement>1</countIncrement>
    </DataSet>

    <DataSet type="com.itko.lisa.test.CounterDataSet" name="FilterParamNbr" atend="Store Current Filter Set" local="true" random="false" maxItemsToFetch="0" >
<sample>rO0ABXNyABFqYXZhLnV0aWwuSGFzaE1hcAUH2sHDFmDRAwACRgAKbG9hZEZhY3RvckkACXRocmVzaG9sZHhwP0AAAAAAAAB3CAAAABAAAAAAeA==</sample>
    <propKey>FilterParamNbr</propKey>
    <countFrom>1</countFrom>
    <countTo>{{RspFilterParamNbr}}</countTo>
    <countIncrement>1</countIncrement>
    </DataSet>

    <DataSet type="com.itko.lisa.test.CounterDataSet" name="CurrentAssertionSetNbr" atend="All Assertion Sets Done" local="true" random="false" maxItemsToFetch="0" >
<sample>rO0ABXNyABFqYXZhLnV0aWwuSGFzaE1hcAUH2sHDFmDRAwACRgAKbG9hZEZhY3RvckkACXRocmVzaG9sZHhwP0AAAAAAAAB3CAAAABAAAAAAeA==</sample>
    <propKey>CurrentAssertionSetNbr</propKey>
    <countFrom>1</countFrom>
    <countTo>{{RspAssertionSetNbr}}</countTo>
    <countIncrement>1</countIncrement>
    </DataSet>

    <DataSet type="com.itko.lisa.test.CounterDataSet" name="CurrentFilterSetNbr" atend="All Filter Sets Done" local="true" random="false" maxItemsToFetch="0" >
<sample>rO0ABXNyABFqYXZhLnV0aWwuSGFzaE1hcAUH2sHDFmDRAwACRgAKbG9hZEZhY3RvckkACXRocmVzaG9sZHhwP0AAAAAAAAB3CAAAABAAAAAAeA==</sample>
    <propKey>CurrentFilterSetNbr</propKey>
    <countFrom>1</countFrom>
    <countTo>{{RspFilterSetNbr}}</countTo>
    <countIncrement>1</countIncrement>
    </DataSet>

</TestCase>
