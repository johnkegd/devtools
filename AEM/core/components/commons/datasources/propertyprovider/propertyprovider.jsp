<%--
  ADOBE CONFIDENTIAL
  Copyright 2014 Adobe Systems Incorporated
  All Rights Reserved.
  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and may be covered by U.S. and Foreign Patents,
  patents in process, and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
--%>
<%@page session="false" %>
<%@include file="/libs/granite/ui/global.jsp" %>
<%
%>
<%@page import="com.adobe.aemds.guide.utils.GuidePropertyProviderUtils,
                com.adobe.granite.ui.components.Config,
                com.adobe.granite.ui.components.ds.DataSource,
                com.adobe.granite.ui.components.ExpressionHelper,
                com.adobe.granite.ui.components.ds.SimpleDataSource,
                com.adobe.granite.ui.components.ds.ValueMapResource,
                org.apache.commons.collections.Transformer,
                org.apache.commons.collections.iterators.TransformIterator,
                org.apache.sling.api.resource.Resource,
                org.apache.sling.api.resource.ResourceResolver,
                org.apache.sling.api.resource.ValueMap,
                org.apache.sling.api.wrappers.ValueMapDecorator,
                org.apache.sling.commons.json.JSONArray,
                org.apache.sling.commons.json.JSONObject,
                org.apache.commons.lang.StringUtils,
                java.util.ArrayList,
                java.util.HashMap,
                java.util.List,
                java.util.Map" %>
<%
    /**
     *   A datasource to replicate behavior of GuidePropertyProvider
     *
     *   @datasource
     *   @name PropertyProvider
     *   @location /libs/fd/af/components/commons/datasources/propertyprovider
     *
     *   @example
     *   + datasource
     *      - jcr:primaryType = "nt:unstructured"
     *      - sling:resourceType = "fd/af/components/commons/datasources/propertyprovider"
     *      - type = {info type for which properties are requested}
     *      - prop1 = {a property as per the type requirement}
     */
//TODO: Need to remove code duplicacy and move a large chunk of this code to a util which GuidePropertyProvider as well as datasources can access
    final ExpressionHelper ex = cmp.getExpressionHelper();
    Config dsCfg = new Config(resource.getChild(Config.DATASOURCE));
    final String type = ex.getString(dsCfg.get("type", String.class));
    final String layoutType = dsCfg.get("layoutType", String.class);
    final String isAfField = dsCfg.get("isAfField", String.class);
    final String guideNodeClass = dsCfg.get("guideNodeClass", String.class);
    final String rootPath = dsCfg.get("rootPath", String.class);

    final String SUBMIT_ACTION = "submitAction";
    final String AUTO_SAVE_ACTION = "autoSaveAction";
    final String LAYOUT = "layout";
    final String MOBILELAYOUT = "mobilelayout";
    final String THEME = "theme";
    final String CHART_REDUCER = "chartReducer";
    final String FORMATTERS = "formatters";
    final String VALIDATORS = "validators";
    final String PREFILL_SERVICE_PROVIDER = "prefillServiceProvider";
    final String DOCUMENT_FRAGMENT_LAYOUT = "documentFragmentLayout";
    final String LCPROCESS = "lcProcess";
    final String ESIGN_CLOUD_SERVICE_CONFIGURATION = "esignCloudServiceConfiguration";
    final String CAPTCHA_SERVICE = "captchaService";
    final String RECAPTCHA_CLOUD_SERVICE_CONFIGURATION = "recaptchaCloudServiceConfiguration";
    final String TYPEKIT_CLOUD_SERVICE_CONFIGURATION = "typekitCloudServiceConfiguration";
    final String BEFORE_PAGINATION = "beforeBreakPaginationType"; //Specifies where the panel is to be placed
    final String AFTER_PAGINATION = "afterBreakPaginationType"; //Specifies which area to fill after the panel is placed
    final String OVERFLOW_PAGINATION = "overflowPaginationType"; // Sets an overflow for a panel that spans pages
    final ResourceResolver resolver = slingRequest.getResourceResolver();
    String searchPaths[] = resolver.getSearchPath();
    final String path = resource.getPath();
    final String guideContainerPath = slingRequest.getRequestPathInfo().getSuffix();
    final Resource requestSuffixResource = slingRequest.getRequestPathInfo().getSuffixResource();

    final GuidePropertyProviderUtils guidePropertyProviderUtils = sling.getService(GuidePropertyProviderUtils.class);

//Make sure to keep this name same for every call made to guidePropertyProviderUtils
    JSONArray jsonArrResponse = new JSONArray();
    if (type != null) {
        Map<String, String> optionsMap = new HashMap<String, String>();
        if (type.equalsIgnoreCase(SUBMIT_ACTION) || type.equalsIgnoreCase(AUTO_SAVE_ACTION)) {
            String requestedDataModel = dsCfg.get("guideDataModel", String.class);
            optionsMap.put("type", type);
            optionsMap.put("guideDataModel", requestedDataModel);
            jsonArrResponse = guidePropertyProviderUtils.querySubmitOrAutoSaveAction(searchPaths, optionsMap);
        } else if (type.equalsIgnoreCase(LAYOUT)) {
            optionsMap.put("layoutType", layoutType);
            optionsMap.put("isAfField", isAfField);
            jsonArrResponse = guidePropertyProviderUtils.queryLayout(searchPaths, optionsMap, slingRequest);
        } else if (type.equalsIgnoreCase(MOBILELAYOUT)) {
            jsonArrResponse = guidePropertyProviderUtils.queryMobileLayout(searchPaths);
        } else if (type.equalsIgnoreCase(CHART_REDUCER)) {
            jsonArrResponse = guidePropertyProviderUtils.queryChartReducer(searchPaths);
        } else if (type.equalsIgnoreCase(FORMATTERS)) {
            jsonArrResponse = guidePropertyProviderUtils.queryFormatters(guideNodeClass, searchPaths);
        } else if (type.equalsIgnoreCase(VALIDATORS)) {
            jsonArrResponse = guidePropertyProviderUtils.queryValidators(guideNodeClass, searchPaths);
        } else if (type.equalsIgnoreCase(THEME)) {
            jsonArrResponse = guidePropertyProviderUtils.queryTheme();
        } else if (PREFILL_SERVICE_PROVIDER.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.queryPrefillServiceProviders();
            for (int i = 0; i < jsonArrResponse.length(); i++) {
                JSONObject objectArr = jsonArrResponse.getJSONObject(i);
                if(StringUtils.isEmpty(objectArr.get("text").toString()) && StringUtils.isEmpty(objectArr.get("value").toString())){
                    objectArr.put("text", i18n.get("None"));
                }
            }
        } else if (DOCUMENT_FRAGMENT_LAYOUT.equals(type)){
            jsonArrResponse = guidePropertyProviderUtils.queryDocumentFragmentLayout(searchPaths);
        } else if (ESIGN_CLOUD_SERVICE_CONFIGURATION.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.fetchEsignCloudServiceConfiguration(rootPath, requestSuffixResource);
        } else if (LCPROCESS.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.queryLcProcess();
        } else if (CAPTCHA_SERVICE.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.queryCaptchaService(searchPaths);
        } else if (RECAPTCHA_CLOUD_SERVICE_CONFIGURATION.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.fetchRecaptchaCloudServiceConfiguration(rootPath, requestSuffixResource);
        } else if (TYPEKIT_CLOUD_SERVICE_CONFIGURATION.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.fetchTypekitCloudServiceConfiguration(slingRequest);
        } else if (BEFORE_PAGINATION.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.getBeforePaginationList(slingRequest, i18n);
        }  else if (AFTER_PAGINATION.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.getAfterPaginationList(slingRequest, i18n);
        } else if (OVERFLOW_PAGINATION.equals(type)) {
            jsonArrResponse = guidePropertyProviderUtils.getOverflowPaginationList(slingRequest, i18n);
        }

        //Add logic for different types after adding an else block
        DataSource ds = new SimpleDataSource(new TransformIterator(guidePropertyProviderUtils.getJSONIterator(jsonArrResponse), new Transformer() {
            public Object transform(Object input) {
                try {
                    Map<String, Object> result = guidePropertyProviderUtils.getMapFromJSONObject((JSONObject) input);
                    ValueMap vm = new ValueMapDecorator(result);
                    List<Resource> children = new ArrayList<Resource>();

                    if (vm.containsKey("granite:data")) {
                        Map graniteData = null;
                        Object obj = vm.get("granite:data");
                        if (obj instanceof Map) {
                            graniteData = (Map) obj;
                            ValueMap childValueMap = new ValueMapDecorator(graniteData);
                            Resource childResource = new ValueMapResource(resolver, path + "/granite:data", "nt:unstructured", childValueMap);
                            children.add(childResource);
                        }
                    }

                    return new ValueMapResource(resolver, path, "nt:unstructured", vm, children);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }));
        request.setAttribute(DataSource.class.getName(), ds);
    }
%>
