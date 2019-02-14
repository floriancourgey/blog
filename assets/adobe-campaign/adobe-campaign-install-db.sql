
-- Log: Creating table 'CrmBehavioralAggregate'


CREATE TABLE CrmBehavioralAggregate(
  iRecipientId INTEGER NOT NULL Default 0, 
  iRuleId INTEGER NOT NULL Default 0, 
  iScore INTEGER NOT NULL Default 0, 
  tsLastEvent TIMESTAMPTZ
);

CREATE UNIQUE INDEX avioralAggregate_recipientRule ON CrmBehavioralAggregate(iRecipientId, iRuleId);
CREATE INDEX CrmBehavioralAggregate_ruleId ON CrmBehavioralAggregate(iRuleId);
  
-- Log: Creating table 'CrmCompany'


CREATE TABLE CrmCompany(
  iCompanyId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLowerName VARCHAR(255), 
  sName VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX CrmCompany_id ON CrmCompany(iCompanyId);
CREATE UNIQUE INDEX CrmCompany_lowerName ON CrmCompany(sLowerName);
CREATE UNIQUE INDEX CrmCompany_name ON CrmCompany(sName);
CREATE INDEX CrmCompany_modifiedById ON CrmCompany(iModifiedById);
CREATE INDEX CrmCompany_createdById ON CrmCompany(iCreatedById);
  
INSERT INTO CrmCompany (iCompanyId) VALUES (0); 

-- Log: Creating table 'CrmCompanySynonym'


CREATE TABLE CrmCompanySynonym(
  iCompanyId INTEGER NOT NULL Default 0, 
  iCompanySynonymId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  sLowerSynonym VARCHAR(255), 
  sSynonym VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX CrmCompanySynonym_lowerSynonym ON CrmCompanySynonym(sLowerSynonym);
CREATE UNIQUE INDEX CrmCompanySynonym_id ON CrmCompanySynonym(iCompanySynonymId);
CREATE UNIQUE INDEX CrmCompanySynonym_synonym ON CrmCompanySynonym(iCompanyId, iType, sLowerSynonym);
CREATE INDEX CrmCompanySynonym_modifiedByI ON CrmCompanySynonym(iModifiedById);
CREATE INDEX CrmCompanySynonym_createdById ON CrmCompanySynonym(iCreatedById);
  
INSERT INTO CrmCompanySynonym (iCompanySynonymId) VALUES (0); 

-- Log: Creating table 'CrmEmailDomain'


CREATE TABLE CrmEmailDomain(
  iCreatedById INTEGER NOT NULL Default 0, 
  iEmailDomainId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sStartsWith VARCHAR(20), 
  sStatus VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX CrmEmailDomain_id ON CrmEmailDomain(iEmailDomainId);
CREATE UNIQUE INDEX CrmEmailDomain_domain ON CrmEmailDomain(sStartsWith);
CREATE INDEX CrmEmailDomain_modifiedById ON CrmEmailDomain(iModifiedById);
CREATE INDEX CrmEmailDomain_createdById ON CrmEmailDomain(iCreatedById);
  
INSERT INTO CrmEmailDomain (iEmailDomainId) VALUES (0); 

-- Log: Creating table 'CrmIncomingLead'


CREATE TABLE CrmIncomingLead(
  dParticipationDuration DOUBLE PRECISION, 
  iAckDeliveryId INTEGER NOT NULL Default 0, 
  iAcknowledgment SMALLINT NOT NULL Default 0, 
  iBANTScoreMsgId INTEGER NOT NULL Default 0, 
  iBANTscore INTEGER NOT NULL Default 0, 
  iCleansed SMALLINT NOT NULL Default 0, 
  iCompanyId INTEGER NOT NULL Default 0, 
  iConnectionOnTime SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCrmInstanceId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFileImportId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iIncomingLeadId INTEGER NOT NULL Default 0, 
  iLandingPageId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOpportunityId INTEGER NOT NULL Default 0, 
  iOutgoingLeadId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iQuestionsAsked INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iSalesAccountId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iUsedChat SMALLINT NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  mDescription TEXT, 
  sAbandonReason VARCHAR(64), 
  sAddress1 VARCHAR(255), 
  sAddress2 VARCHAR(255), 
  sAddress3 VARCHAR(255), 
  sAddress4 VARCHAR(80), 
  sAuthority VARCHAR(64), 
  sBlackList VARCHAR(64), 
  sBlackListEmail VARCHAR(64), 
  sBlackListFax VARCHAR(64), 
  sBlackListMobile VARCHAR(64), 
  sBlackListPhone VARCHAR(64), 
  sBlackListPostalMail VARCHAR(64), 
  sBudget VARCHAR(64), 
  sBusinessPhone VARCHAR(120), 
  sCity VARCHAR(120), 
  sCompanyRaw VARCHAR(255), 
  sCountryCode VARCHAR(3), 
  sCountryRaw VARCHAR(120), 
  sCrmContactId VARCHAR(36), 
  sCrmContactMasterRecordId VARCHAR(36), 
  sCrmLeadId VARCHAR(36), 
  sCrmLeadMasterRecordId VARCHAR(36), 
  sCrmOpportunityId VARCHAR(36), 
  sCrmOwnerId VARCHAR(36), 
  sCrmSalesAccountId VARCHAR(36), 
  sCrmStatus VARCHAR(255), 
  sDepartment VARCHAR(120), 
  sDocUrl VARCHAR(255), 
  sEmail VARCHAR(128), 
  sErrorReason VARCHAR(64), 
  sEventParticipation VARCHAR(64), 
  sFax VARCHAR(120), 
  sFirstName VARCHAR(120), 
  sHomePhone VARCHAR(120), 
  sIndustry VARCHAR(64), 
  sJobTitle VARCHAR(120), 
  sLastName VARCHAR(240), 
  sMiddleName VARCHAR(255), 
  sMobilePhone VARCHAR(120), 
  sNeed VARCHAR(64), 
  sNumberOfEmployees VARCHAR(255), 
  sRating VARCHAR(64), 
  sRevenue VARCHAR(255), 
  sSalutation VARCHAR(100), 
  sSource VARCHAR(64), 
  sSourceId VARCHAR(48), 
  sStateCode VARCHAR(3), 
  sStateRaw VARCHAR(50), 
  sTimeframe VARCHAR(64), 
  sType VARCHAR(64), 
  sUrl VARCHAR(255), 
  sZipCode VARCHAR(60), 
  tsBirth DATE, 
  tsCreated TIMESTAMPTZ, 
  tsCrmLastModified TIMESTAMPTZ, 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsParticipation TIMESTAMPTZ
);

CREATE INDEX CrmIncomingLead_crmContactId ON CrmIncomingLead(sCrmContactId);
CREATE INDEX CrmIncomingLead_crmLeadId ON CrmIncomingLead(sCrmLeadId);
CREATE INDEX rmIncomingLead_crmLastModified ON CrmIncomingLead(tsCrmLastModified);
CREATE INDEX CrmIncomingLead_eventDate ON CrmIncomingLead(iFolderId, tsEvent);
CREATE UNIQUE INDEX CrmIncomingLead_id ON CrmIncomingLead(iIncomingLeadId);
CREATE INDEX CrmIncomingLead_serviceId ON CrmIncomingLead(iServiceId);
CREATE INDEX CrmIncomingLead_ackDeliveryId ON CrmIncomingLead(iAckDeliveryId);
CREATE INDEX CrmIncomingLead_landingPageId ON CrmIncomingLead(iLandingPageId);
CREATE INDEX CrmIncomingLead_companyId ON CrmIncomingLead(iCompanyId);
CREATE INDEX CrmIncomingLead_salesAccountI ON CrmIncomingLead(iSalesAccountId);
CREATE INDEX CrmIncomingLead_recipientId ON CrmIncomingLead(iRecipientId);
CREATE INDEX CrmIncomingLead_opportunityId ON CrmIncomingLead(iOpportunityId);
CREATE INDEX CrmIncomingLead_outgoingLeadI ON CrmIncomingLead(iOutgoingLeadId);
CREATE INDEX CrmIncomingLead_deliveryId ON CrmIncomingLead(iDeliveryId);
CREATE INDEX CrmIncomingLead_operationId ON CrmIncomingLead(iOperationId);
CREATE INDEX CrmIncomingLead_fileImportId ON CrmIncomingLead(iFileImportId);
CREATE INDEX CrmIncomingLead_webAppId ON CrmIncomingLead(iWebAppId);
  
INSERT INTO CrmIncomingLead (iIncomingLeadId) VALUES (0); 

-- Log: Creating table 'CrmLandingPage'


CREATE TABLE CrmLandingPage(
  iAckDeliveryId INTEGER NOT NULL Default 0, 
  iAcknowledgment SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDisplayAddress SMALLINT NOT NULL Default 0, 
  iDisplayBusinessPhone SMALLINT NOT NULL Default 0, 
  iDisplayCompanyName SMALLINT NOT NULL Default 0, 
  iDisplayEmail SMALLINT NOT NULL Default 0, 
  iDisplayFirstName SMALLINT NOT NULL Default 0, 
  iDisplayFunction SMALLINT NOT NULL Default 0, 
  iDisplayMobile SMALLINT NOT NULL Default 0, 
  iDisplayName SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iImageId INTEGER NOT NULL Default 0, 
  iLandingPageId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOffline SMALLINT NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iProxyAppId INTEGER NOT NULL Default 0, 
  iRedirectId INTEGER NOT NULL Default 0, 
  iRenderAppId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iThemeId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sClickHereLabel VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLanguage VARCHAR(32), 
  sName VARCHAR(64), 
  sSubmitLabel VARCHAR(64), 
  sTitle VARCHAR(255), 
  sType VARCHAR(64), 
  sUrl VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE UNIQUE INDEX CrmLandingPage_id ON CrmLandingPage(iLandingPageId);
CREATE UNIQUE INDEX CrmLandingPage_name ON CrmLandingPage(sName);
CREATE INDEX CrmLandingPage_proxyAppId ON CrmLandingPage(iProxyAppId);
CREATE INDEX CrmLandingPage_renderAppId ON CrmLandingPage(iRenderAppId);
CREATE INDEX CrmLandingPage_operationId ON CrmLandingPage(iOperationId);
CREATE INDEX CrmLandingPage_imageId ON CrmLandingPage(iImageId);
CREATE INDEX CrmLandingPage_themeId ON CrmLandingPage(iThemeId);
CREATE INDEX CrmLandingPage_redirectId ON CrmLandingPage(iRedirectId);
CREATE INDEX CrmLandingPage_serviceId ON CrmLandingPage(iServiceId);
CREATE INDEX CrmLandingPage_ackDeliveryId ON CrmLandingPage(iAckDeliveryId);
CREATE INDEX CrmLandingPage_folderId ON CrmLandingPage(iFolderId);
CREATE INDEX CrmLandingPage_modifiedById ON CrmLandingPage(iModifiedById);
CREATE INDEX CrmLandingPage_createdById ON CrmLandingPage(iCreatedById);
  
INSERT INTO CrmLandingPage (iLandingPageId) VALUES (0); 

-- Log: Creating table 'CrmLeadGenerationRule'


CREATE TABLE CrmLeadGenerationRule(
  iActive SMALLINT NOT NULL Default 0, 
  iAggregateRecipient SMALLINT NOT NULL Default 0, 
  iBuildingType SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iExportLead SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iLeadGenerationRuleId INTEGER NOT NULL Default 0, 
  iLinkToGenericLead SMALLINT NOT NULL Default 0, 
  iListId INTEGER NOT NULL Default 0, 
  iMaxScore INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOrder INTEGER NOT NULL Default 0, 
  iPriorityRuleId INTEGER NOT NULL Default 0, 
  iQualifyLead SMALLINT NOT NULL Default 0, 
  iScore INTEGER NOT NULL Default 0, 
  iScoreFormula SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iUseAutomaticFilter SMALLINT NOT NULL Default 0, 
  iUseCapping SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sAuthority VARCHAR(64), 
  sBANTCriterion VARCHAR(64), 
  sBudget VARCHAR(64), 
  sDemographicCriterion VARCHAR(64), 
  sDesc VARCHAR(512), 
  sDestination VARCHAR(64), 
  sEmailDomain VARCHAR(64), 
  sEventDatePath VARCHAR(255), 
  sEventParticipation VARCHAR(64), 
  sEventSchema VARCHAR(255), 
  sIndustry VARCHAR(64), 
  sJobFunction VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLandingPageType VARCHAR(64), 
  sName VARCHAR(64), 
  sNeed VARCHAR(64), 
  sNumberOfEmployees VARCHAR(64), 
  sRating VARCHAR(64), 
  sRevenue VARCHAR(64), 
  sScoreAttr VARCHAR(64), 
  sScoreExpr VARCHAR(255), 
  sScoringType VARCHAR(64), 
  sTimeframe VARCHAR(64), 
  sTrackingType VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX CrmLeadGenerationRule_id ON CrmLeadGenerationRule(iLeadGenerationRuleId);
CREATE UNIQUE INDEX CrmLeadGenerationRule_name ON CrmLeadGenerationRule(sName);
CREATE INDEX CrmLeadGenerationRule_priorit ON CrmLeadGenerationRule(iPriorityRuleId);
CREATE INDEX CrmLeadGenerationRule_listId ON CrmLeadGenerationRule(iListId);
CREATE INDEX CrmLeadGenerationRule_folderI ON CrmLeadGenerationRule(iFolderId);
CREATE INDEX CrmLeadGenerationRule_modifie ON CrmLeadGenerationRule(iModifiedById);
CREATE INDEX CrmLeadGenerationRule_created ON CrmLeadGenerationRule(iCreatedById);
  
INSERT INTO CrmLeadGenerationRule (iLeadGenerationRuleId) VALUES (0); 

-- Log: Creating table 'CrmOpportunity'


CREATE TABLE CrmOpportunity(
  dExpectedRevenue DOUBLE PRECISION NOT NULL Default 0, 
  iCleansed SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCrmInstanceId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOpportunityId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iSalesAccountId INTEGER NOT NULL Default 0, 
  mDescription TEXT, 
  sCrmOpportunityId VARCHAR(36), 
  sCrmOwnerId VARCHAR(36), 
  sCrmSalesAccountId VARCHAR(36), 
  sName VARCHAR(360), 
  sStatus VARCHAR(64), 
  tsClose TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsCrmLastModified TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX CrmOpportunity_id ON CrmOpportunity(iOpportunityId);
CREATE UNIQUE INDEX CrmOpportunity_crmId ON CrmOpportunity(sCrmOpportunityId, iCrmInstanceId);
CREATE INDEX CrmOpportunity_crmInstanceId ON CrmOpportunity(iCrmInstanceId);
CREATE INDEX CrmOpportunity_ownerId ON CrmOpportunity(iOwnerId);
CREATE INDEX CrmOpportunity_operationId ON CrmOpportunity(iOperationId);
CREATE INDEX CrmOpportunity_salesAccountId ON CrmOpportunity(iSalesAccountId);
CREATE INDEX CrmOpportunity_modifiedById ON CrmOpportunity(iModifiedById);
CREATE INDEX CrmOpportunity_createdById ON CrmOpportunity(iCreatedById);
CREATE INDEX CrmOpportunity_folderId ON CrmOpportunity(iFolderId);
  
INSERT INTO CrmOpportunity (iOpportunityId) VALUES (0); 

-- Log: Creating table 'CrmOutgoingLead'


CREATE TABLE CrmOutgoingLead(
  iAbandonned SMALLINT NOT NULL Default 0, 
  iBANTScoreMsgId INTEGER NOT NULL Default 0, 
  iBANTscore INTEGER NOT NULL Default 0, 
  iBehavioralScore INTEGER NOT NULL Default 0, 
  iBehavioralScoreMsgId INTEGER NOT NULL Default 0, 
  iBlackList SMALLINT NOT NULL Default 0, 
  iBlackListEmail SMALLINT NOT NULL Default 0, 
  iBlackListFax SMALLINT NOT NULL Default 0, 
  iBlackListMobile SMALLINT NOT NULL Default 0, 
  iBlackListPhone SMALLINT NOT NULL Default 0, 
  iBlackListPostalMail SMALLINT NOT NULL Default 0, 
  iCompanyId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCrmInstanceId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iDemographicScore INTEGER NOT NULL Default 0, 
  iDemographicScoreMsgId INTEGER NOT NULL Default 0, 
  iFileImportId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iGenericLeadId INTEGER NOT NULL Default 0, 
  iLandingPageId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOpportunityId INTEGER NOT NULL Default 0, 
  iOutgoingLeadId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iRejected SMALLINT NOT NULL Default 0, 
  iSalesAccountId INTEGER NOT NULL Default 0, 
  iToSend SMALLINT NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  mDescription TEXT, 
  sAbandonReason VARCHAR(64), 
  sAddress1 VARCHAR(255), 
  sAddress2 VARCHAR(255), 
  sAddress3 VARCHAR(255), 
  sAddress4 VARCHAR(80), 
  sAuthority VARCHAR(64), 
  sBudget VARCHAR(64), 
  sBusinessPhone VARCHAR(120), 
  sCity VARCHAR(120), 
  sCountryCode VARCHAR(3), 
  sCrmLeadId VARCHAR(36), 
  sCrmStatus VARCHAR(255), 
  sDepartment VARCHAR(120), 
  sDestination VARCHAR(20), 
  sEmail VARCHAR(128), 
  sFax VARCHAR(120), 
  sFirstName VARCHAR(120), 
  sHomePhone VARCHAR(120), 
  sIndustry VARCHAR(64), 
  sJobTitle VARCHAR(120), 
  sLastName VARCHAR(240), 
  sMiddleName VARCHAR(255), 
  sMobilePhone VARCHAR(120), 
  sNeed VARCHAR(64), 
  sNumberOfEmployees VARCHAR(255), 
  sProgressStatus VARCHAR(64), 
  sRating VARCHAR(64), 
  sRatingDesc VARCHAR(128), 
  sRevenue VARCHAR(255), 
  sSalutation VARCHAR(100), 
  sSource VARCHAR(64), 
  sStateCode VARCHAR(3), 
  sTimeframe VARCHAR(64), 
  sUrl VARCHAR(255), 
  sZipCode VARCHAR(60), 
  tsAbandon TIMESTAMPTZ, 
  tsAcceptance TIMESTAMPTZ, 
  tsBirth DATE, 
  tsConversion TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsCrmLastModified TIMESTAMPTZ, 
  tsCrmSending TIMESTAMPTZ, 
  tsFirstActivity TIMESTAMPTZ, 
  tsLastActivity TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsQualification TIMESTAMPTZ, 
  tsRejection TIMESTAMPTZ
);

CREATE INDEX CrmOutgoingLead_crmLeadId ON CrmOutgoingLead(sCrmLeadId);
CREATE INDEX CrmOutgoingLead_lastActivity ON CrmOutgoingLead(iFolderId, tsLastActivity);
CREATE UNIQUE INDEX CrmOutgoingLead_id ON CrmOutgoingLead(iOutgoingLeadId);
CREATE INDEX CrmOutgoingLead_genericLeadId ON CrmOutgoingLead(iGenericLeadId);
CREATE INDEX CrmOutgoingLead_companyId ON CrmOutgoingLead(iCompanyId);
CREATE INDEX CrmOutgoingLead_salesAccountI ON CrmOutgoingLead(iSalesAccountId);
CREATE INDEX CrmOutgoingLead_ownerId ON CrmOutgoingLead(iOwnerId);
CREATE INDEX CrmOutgoingLead_recipientId ON CrmOutgoingLead(iRecipientId);
CREATE INDEX CrmOutgoingLead_opportunityId ON CrmOutgoingLead(iOpportunityId);
CREATE INDEX CrmOutgoingLead_deliveryId ON CrmOutgoingLead(iDeliveryId);
CREATE INDEX CrmOutgoingLead_operationId ON CrmOutgoingLead(iOperationId);
CREATE INDEX CrmOutgoingLead_fileImportId ON CrmOutgoingLead(iFileImportId);
CREATE INDEX CrmOutgoingLead_webAppId ON CrmOutgoingLead(iWebAppId);
CREATE INDEX CrmOutgoingLead_landingPageId ON CrmOutgoingLead(iLandingPageId);
  
INSERT INTO CrmOutgoingLead (iOutgoingLeadId) VALUES (0); 

-- Log: Creating table 'CrmSalesAccount'


CREATE TABLE CrmSalesAccount(
  iBlackList SMALLINT NOT NULL Default 0, 
  iBlackListEmail SMALLINT NOT NULL Default 0, 
  iBlackListFax SMALLINT NOT NULL Default 0, 
  iBlackListMobile SMALLINT NOT NULL Default 0, 
  iBlackListPhone SMALLINT NOT NULL Default 0, 
  iBlackListPostalMail SMALLINT NOT NULL Default 0, 
  iCleansed SMALLINT NOT NULL Default 0, 
  iCompanyId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCrmInstanceId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iNumberOfEmployees INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iSalesAccountId INTEGER NOT NULL Default 0, 
  mDescription TEXT, 
  sAddress1 VARCHAR(255), 
  sAddress2 VARCHAR(255), 
  sAddress3 VARCHAR(255), 
  sAddress4 VARCHAR(80), 
  sCity VARCHAR(120), 
  sCompanyRaw VARCHAR(255), 
  sCountryCode VARCHAR(3), 
  sCountryRaw VARCHAR(120), 
  sCrmOwnerId VARCHAR(36), 
  sCrmSalesAccountId VARCHAR(36), 
  sFax VARCHAR(120), 
  sIndustry VARCHAR(64), 
  sName VARCHAR(255), 
  sNumber VARCHAR(40), 
  sOtherPhone VARCHAR(120), 
  sPhone VARCHAR(120), 
  sRating VARCHAR(64), 
  sStateCode VARCHAR(3), 
  sStateRaw VARCHAR(50), 
  sUrl VARCHAR(255), 
  sZipCode VARCHAR(60), 
  tsCreated TIMESTAMPTZ, 
  tsCrmLastModified TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX CrmSalesAccount_id ON CrmSalesAccount(iSalesAccountId);
CREATE UNIQUE INDEX CrmSalesAccount_crmId ON CrmSalesAccount(sCrmSalesAccountId, iCrmInstanceId);
CREATE INDEX CrmSalesAccount_companyId ON CrmSalesAccount(iCompanyId);
CREATE INDEX CrmSalesAccount_crmInstanceId ON CrmSalesAccount(iCrmInstanceId);
CREATE INDEX CrmSalesAccount_ownerId ON CrmSalesAccount(iOwnerId);
CREATE INDEX CrmSalesAccount_modifiedById ON CrmSalesAccount(iModifiedById);
CREATE INDEX CrmSalesAccount_createdById ON CrmSalesAccount(iCreatedById);
CREATE INDEX CrmSalesAccount_folderId ON CrmSalesAccount(iFolderId);
  
INSERT INTO CrmSalesAccount (iSalesAccountId) VALUES (0); 

-- Log: Creating table 'CrmScoringDescDict'


CREATE TABLE CrmScoringDescDict(
  iScoringDescDictId INTEGER NOT NULL Default 0, 
  mText TEXT, 
  sMd5 VARCHAR(32), 
  tsCreated TIMESTAMPTZ
);

CREATE UNIQUE INDEX CrmScoringDescDict_id ON CrmScoringDescDict(iScoringDescDictId);
CREATE UNIQUE INDEX CrmScoringDescDict_md5 ON CrmScoringDescDict(sMd5);
  
INSERT INTO CrmScoringDescDict (iScoringDescDictId) VALUES (0); 

-- Log: Creating table 'CrmWebAppLogLead'


CREATE TABLE CrmWebAppLogLead(
  dScore DOUBLE PRECISION NOT NULL Default 0, 
  iCreation SMALLINT NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iIncomingLeadId INTEGER NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  iWebAppLogLeadId INTEGER NOT NULL Default 0, 
  sLanguage VARCHAR(2), 
  sOrigin VARCHAR(80), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX CrmWebAppLogLead_date ON CrmWebAppLogLead(iWebAppId, tsLog);
CREATE UNIQUE INDEX CrmWebAppLogLead_id ON CrmWebAppLogLead(iWebAppLogLeadId);
CREATE INDEX CrmWebAppLogLead_deliveryId ON CrmWebAppLogLead(iDeliveryId);
CREATE INDEX CrmWebAppLogLead_incomingLead ON CrmWebAppLogLead(iIncomingLeadId);
  
INSERT INTO CrmWebAppLogLead (iWebAppLogLeadId) VALUES (0); 

-- Log: Creating table 'NcmContent'


CREATE TABLE NcmContent(
  iChannelId INTEGER NOT NULL Default 0, 
  iContentId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sEditForm VARCHAR(80), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sPublishingName VARCHAR(80), 
  sPublishingNamespace VARCHAR(16), 
  sXtkschema VARCHAR(80), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NcmContent_id ON NcmContent(iContentId);
CREATE UNIQUE INDEX NcmContent_name ON NcmContent(sName);
CREATE INDEX NcmContent_publishingNamespac ON NcmContent(sPublishingNamespace, sPublishingName);
CREATE INDEX NcmContent_channelId ON NcmContent(iChannelId);
CREATE INDEX NcmContent_modifiedById ON NcmContent(iModifiedById);
CREATE INDEX NcmContent_createdById ON NcmContent(iCreatedById);
  
INSERT INTO NcmContent (iContentId) VALUES (0); 

-- Log: Creating table 'NmsAddress'


CREATE TABLE NmsAddress(
  iAddressId INTEGER NOT NULL Default 0, 
  iConsecutiveError INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iQuarantineReason SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mQuarantineText VARCHAR(255), 
  sAddress VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsLastError TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsAddress_orderList ON NmsAddress(tsLastModified, iStatus);
CREATE UNIQUE INDEX NmsAddress_id ON NmsAddress(iAddressId);
CREATE UNIQUE INDEX NmsAddress_address ON NmsAddress(sAddress, iType);
CREATE INDEX NmsAddress_deliveryId ON NmsAddress(iDeliveryId);
  
INSERT INTO NmsAddress (iAddressId) VALUES (0); 

-- Log: Creating table 'NmsAsset'


CREATE TABLE NmsAsset(
  iAssetId INTEGER NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCodepage INTEGER NOT NULL Default 0, 
  iContainerId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iEditedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iHeight INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iLanguage SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iProofReaderId INTEGER NOT NULL Default 0, 
  iPublish SMALLINT NOT NULL Default 0, 
  iResourceType SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iStorageType SMALLINT NOT NULL Default 0, 
  iUseMd5AsFilename SMALLINT NOT NULL Default 0, 
  iWidth INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sAlt VARCHAR(64), 
  sContentType VARCHAR(100), 
  sFileName VARCHAR(255), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sMd5 VARCHAR(32), 
  sNature VARCHAR(64), 
  sOriginalName VARCHAR(255), 
  sOriginalServer VARCHAR(255), 
  sVersion VARCHAR(20), 
  tsAvailability DATE, 
  tsCheckOut TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsExpectedCheckIn TIMESTAMPTZ, 
  tsExpectedPublication DATE, 
  tsExpectedValidation DATE, 
  tsLastModified TIMESTAMPTZ, 
  tsPublication TIMESTAMPTZ, 
  tsReminder DATE
);

CREATE INDEX NmsAsset_lastModified ON NmsAsset(iFolderId, tsLastModified);
CREATE UNIQUE INDEX NmsAsset_id ON NmsAsset(iAssetId);
CREATE UNIQUE INDEX NmsAsset_name ON NmsAsset(sInternalName);
CREATE INDEX NmsAsset_proofReaderId ON NmsAsset(iProofReaderId);
CREATE INDEX NmsAsset_ownerId ON NmsAsset(iOwnerId);
CREATE INDEX NmsAsset_editedById ON NmsAsset(iEditedById);
CREATE INDEX NmsAsset_modifiedById ON NmsAsset(iModifiedById);
CREATE INDEX NmsAsset_createdById ON NmsAsset(iCreatedById);
CREATE INDEX NmsAsset_containerId ON NmsAsset(iContainerId);
  
INSERT INTO NmsAsset (iAssetId) VALUES (0); 

-- Log: Creating table 'NmsAttachments'


CREATE TABLE NmsAttachments(
  iAttachmentId INTEGER NOT NULL Default 0, 
  iCodePage INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  mSource TEXT, 
  sCompressMode VARCHAR(255), 
  sContentType VARCHAR(100), 
  sLabel VARCHAR(128), 
  sMd5 VARCHAR(32)
);

CREATE UNIQUE INDEX NmsAttachments_id ON NmsAttachments(iAttachmentId);
CREATE INDEX NmsAttachments_deliveryId ON NmsAttachments(iDeliveryId);
  
INSERT INTO NmsAttachments (iAttachmentId) VALUES (0); 

-- Log: Creating table 'NmsBatchEvent'


CREATE TABLE NmsBatchEvent(
  iAddrErrorCount INTEGER NOT NULL Default 0, 
  iAddrQuality INTEGER NOT NULL Default 0, 
  iBatchEventId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iEmailFormat SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iWishedChannel SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sCountryCode VARCHAR(2), 
  sEmail VARCHAR(128), 
  sExternalId VARCHAR(64), 
  sLanguage VARCHAR(32), 
  sLine1 VARCHAR(80), 
  sLine2 VARCHAR(80), 
  sLine3 VARCHAR(80), 
  sLine4 VARCHAR(80), 
  sLine5 VARCHAR(80), 
  sLine6 VARCHAR(80), 
  sLine7 VARCHAR(80), 
  sMobilePhone VARCHAR(32), 
  sOrigin VARCHAR(64), 
  sType VARCHAR(64), 
  tsAddrLastCheck TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsExpiration TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsProcessed TIMESTAMPTZ, 
  tsProcessing TIMESTAMPTZ, 
  tsScheduled TIMESTAMPTZ, 
  tsSubmit TIMESTAMPTZ
);

CREATE INDEX NmsBatchEvent_status ON NmsBatchEvent(iStatus);
CREATE INDEX NmsBatchEvent_type ON NmsBatchEvent(sType);
CREATE INDEX NmsBatchEvent_lastModified ON NmsBatchEvent(tsLastModified);
CREATE UNIQUE INDEX NmsBatchEvent_id ON NmsBatchEvent(iBatchEventId);
CREATE INDEX NmsBatchEvent_deliveryId ON NmsBatchEvent(iDeliveryId);
  
INSERT INTO NmsBatchEvent (iBatchEventId) VALUES (0); 

-- Log: Creating table 'NmsBilling'


CREATE TABLE NmsBilling(
  bData BYTEA, 
  iBillingId INTEGER NOT NULL Default 0, 
  sName VARCHAR(128)
);

CREATE UNIQUE INDEX NmsBilling_id ON NmsBilling(iBillingId);
  
INSERT INTO NmsBilling (iBillingId) VALUES (0); 

-- Log: Creating table 'NmsBroadLogBatchEvent'


CREATE TABLE NmsBroadLogBatchEvent(
  iBatchEventId INTEGER NOT NULL Default 0, 
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX roadLogBatchEvent_lastModified ON NmsBroadLogBatchEvent(tsLastModified);
CREATE INDEX NmsBroadLogBatchEvent_delivery ON NmsBroadLogBatchEvent(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsBroadLogBatchEvent_id ON NmsBroadLogBatchEvent(iBroadLogId);
CREATE INDEX NmsBroadLogBatchEvent_batchEv ON NmsBroadLogBatchEvent(iBatchEventId);
  
INSERT INTO NmsBroadLogBatchEvent (iBroadLogId) VALUES (0); 

-- Log: Creating table 'NmsBroadLogEventHisto'


CREATE TABLE NmsBroadLogEventHisto(
  biEventId BIGINT NOT NULL Default 0, 
  iBroadLogId BIGINT NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iExtAccountId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX roadLogEventHisto_lastModified ON NmsBroadLogEventHisto(tsLastModified);
CREATE INDEX NmsBroadLogEventHisto_delivery ON NmsBroadLogEventHisto(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsBroadLogEventHisto_id ON NmsBroadLogEventHisto(iBroadLogId);
CREATE INDEX NmsBroadLogEventHisto_extAcco ON NmsBroadLogEventHisto(iExtAccountId);
CREATE INDEX NmsBroadLogEventHisto_eventId ON NmsBroadLogEventHisto(biEventId);
  
-- Log: Creating table 'NmsBroadLogMsg'


CREATE TABLE NmsBroadLogMsg(
  iBroadLogMsgId INTEGER NOT NULL Default 0, 
  iCount INTEGER NOT NULL Default 0, 
  iFailureReason SMALLINT NOT NULL Default 0, 
  iFailureType SMALLINT NOT NULL Default 0, 
  iQualifStatus SMALLINT NOT NULL Default 0, 
  iRuleId INTEGER NOT NULL Default 0, 
  sFirstAddress VARCHAR(128), 
  sFirstText VARCHAR(512), 
  sMd5 VARCHAR(32), 
  sText VARCHAR(512), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsBroadLogMsg_count ON NmsBroadLogMsg(iCount);
CREATE UNIQUE INDEX NmsBroadLogMsg_id ON NmsBroadLogMsg(iBroadLogMsgId);
CREATE UNIQUE INDEX NmsBroadLogMsg_md5 ON NmsBroadLogMsg(sMd5);
CREATE INDEX NmsBroadLogMsg_ruleId ON NmsBroadLogMsg(iRuleId);
  
INSERT INTO NmsBroadLogMsg (iBroadLogMsgId) VALUES (0); 

-- Log: Creating table 'NmsBroadLogOp'


CREATE TABLE NmsBroadLogOp(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsBroadLogOp_operator ON NmsBroadLogOp(iOperatorId, tsLastModified);
CREATE INDEX NmsBroadLogOp_lastModified ON NmsBroadLogOp(tsLastModified);
CREATE INDEX NmsBroadLogOp_delivery ON NmsBroadLogOp(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsBroadLogOp_id ON NmsBroadLogOp(iBroadLogId);
  
INSERT INTO NmsBroadLogOp (iBroadLogId) VALUES (0); 

-- Log: Creating table 'NmsBroadLogRcp'


CREATE TABLE NmsBroadLogRcp(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsBroadLogRcp_recipient ON NmsBroadLogRcp(iRecipientId, tsLastModified);
CREATE INDEX NmsBroadLogRcp_lastModified ON NmsBroadLogRcp(tsLastModified);
CREATE INDEX NmsBroadLogRcp_delivery ON NmsBroadLogRcp(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsBroadLogRcp_id ON NmsBroadLogRcp(iBroadLogId);
  
INSERT INTO NmsBroadLogRcp (iBroadLogId) VALUES (0); 

-- Log: Creating table 'NmsBroadLogRtEvent'


CREATE TABLE NmsBroadLogRtEvent(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iRtEventId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX msBroadLogRtEvent_lastModified ON NmsBroadLogRtEvent(tsLastModified);
CREATE INDEX NmsBroadLogRtEvent_delivery ON NmsBroadLogRtEvent(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsBroadLogRtEvent_id ON NmsBroadLogRtEvent(iBroadLogId);
CREATE INDEX NmsBroadLogRtEvent_rtEventId ON NmsBroadLogRtEvent(iRtEventId);
  
INSERT INTO NmsBroadLogRtEvent (iBroadLogId) VALUES (0); 

-- Log: Creating table 'NmsBroadLogSvc'


CREATE TABLE NmsBroadLogSvc(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iSocialAudience INTEGER NOT NULL Default 0, 
  iSocialComments INTEGER NOT NULL Default 0, 
  iSocialLikes INTEGER NOT NULL Default 0, 
  iSocialRetweets INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsBroadLogSvc_service ON NmsBroadLogSvc(iServiceId, tsLastModified);
CREATE INDEX NmsBroadLogSvc_lastModified ON NmsBroadLogSvc(tsLastModified);
CREATE INDEX NmsBroadLogSvc_delivery ON NmsBroadLogSvc(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsBroadLogSvc_id ON NmsBroadLogSvc(iBroadLogId);
  
INSERT INTO NmsBroadLogSvc (iBroadLogId) VALUES (0); 

-- Log: Creating table 'NmsBroadLogVisitor'


CREATE TABLE NmsBroadLogVisitor(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iVisitorId INTEGER NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsBroadLogVisitor_visitor ON NmsBroadLogVisitor(iVisitorId, tsLastModified);
CREATE INDEX msBroadLogVisitor_lastModified ON NmsBroadLogVisitor(tsLastModified);
CREATE INDEX NmsBroadLogVisitor_delivery ON NmsBroadLogVisitor(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsBroadLogVisitor_id ON NmsBroadLogVisitor(iBroadLogId);
  
INSERT INTO NmsBroadLogVisitor (iBroadLogId) VALUES (0); 

-- Log: Creating table 'NmsBudget'


CREATE TABLE NmsBudget(
  dAllocated DOUBLE PRECISION NOT NULL Default 0, 
  dCommitted DOUBLE PRECISION NOT NULL Default 0, 
  dExpensed DOUBLE PRECISION NOT NULL Default 0, 
  dInvoiced DOUBLE PRECISION NOT NULL Default 0, 
  dPlanned DOUBLE PRECISION NOT NULL Default 0, 
  dReserved DOUBLE PRECISION NOT NULL Default 0, 
  iAttachedBudgetId INTEGER NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCurrencyId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsEnd DATE, 
  tsLastModified TIMESTAMPTZ, 
  tsStart DATE
);

CREATE UNIQUE INDEX NmsBudget_id ON NmsBudget(iBudgetId);
CREATE UNIQUE INDEX NmsBudget_name ON NmsBudget(sName);
CREATE INDEX NmsBudget_folderId ON NmsBudget(iFolderId);
CREATE INDEX NmsBudget_attachedBudgetId ON NmsBudget(iAttachedBudgetId);
CREATE INDEX NmsBudget_currencyId ON NmsBudget(iCurrencyId);
CREATE INDEX NmsBudget_modifiedById ON NmsBudget(iModifiedById);
CREATE INDEX NmsBudget_createdById ON NmsBudget(iCreatedById);
  
INSERT INTO NmsBudget (iBudgetId) VALUES (0); 

-- Log: Creating table 'NmsBudgetCategory'


CREATE TABLE NmsBudgetCategory(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iBudgetCategoryId INTEGER NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iCategoryId INTEGER NOT NULL Default 0, 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX NmsBudgetCategory_id ON NmsBudgetCategory(iBudgetCategoryId);
CREATE UNIQUE INDEX NmsBudgetCategory_name ON NmsBudgetCategory(sName);
CREATE INDEX NmsBudgetCategory_budgetId ON NmsBudgetCategory(iBudgetId);
CREATE INDEX NmsBudgetCategory_categoryId ON NmsBudgetCategory(iCategoryId);
  
INSERT INTO NmsBudgetCategory (iBudgetCategoryId) VALUES (0); 

-- Log: Creating table 'NmsCalendarEvent'


CREATE TABLE NmsCalendarEvent(
  dDuration DOUBLE PRECISION, 
  iCalendarEventId INTEGER NOT NULL Default 0, 
  iInstanceType SMALLINT NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sExternalId VARCHAR(255), 
  sExternalLink VARCHAR(255), 
  sNature VARCHAR(64), 
  sSubject VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE INDEX NmsCalendarEvent_end ON NmsCalendarEvent(tsEnd);
CREATE UNIQUE INDEX NmsCalendarEvent_externalLink ON NmsCalendarEvent(sExternalLink);
CREATE INDEX NmsCalendarEvent_externalId ON NmsCalendarEvent(sExternalId);
CREATE UNIQUE INDEX NmsCalendarEvent_id ON NmsCalendarEvent(iCalendarEventId);
CREATE INDEX NmsCalendarEvent_operatorId ON NmsCalendarEvent(iOperatorId);
  
INSERT INTO NmsCalendarEvent (iCalendarEventId) VALUES (0); 

-- Log: Creating table 'NmsCallCenterOfferView'


CREATE TABLE NmsCallCenterOfferView(
  iCallCenterOfferViewId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iSpaceId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  tsPublication TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsCallCenterOfferView_id ON NmsCallCenterOfferView(iCallCenterOfferViewId);
CREATE UNIQUE INDEX NmsCallCenterOfferView_type ON NmsCallCenterOfferView(iOfferId, iSpaceId);
CREATE INDEX NmsCallCenterOfferView_spaceI ON NmsCallCenterOfferView(iSpaceId);
  
INSERT INTO NmsCallCenterOfferView (iCallCenterOfferViewId) VALUES (0); 

-- Log: Creating table 'NmsCategory'


CREATE TABLE NmsCategory(
  iCategoryId INTEGER NOT NULL Default 0, 
  iGlobal SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sNature VARCHAR(64)
);

CREATE UNIQUE INDEX NmsCategory_id ON NmsCategory(iCategoryId);
CREATE UNIQUE INDEX NmsCategory_name ON NmsCategory(sName);
  
INSERT INTO NmsCategory (iCategoryId) VALUES (0); 

-- Log: Creating table 'NmsCentralCatalog'


CREATE TABLE NmsCentralCatalog(
  iActiveLimit SMALLINT NOT NULL Default 0, 
  iActiveProof SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCentralCatalogId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCumulateNotif SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOrderFolderId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iSendNotif SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iUseMultipleCreation SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sNature VARCHAR(64), 
  tsAvailability DATE, 
  tsCreated TIMESTAMPTZ, 
  tsEnd DATE, 
  tsExpectedValidation DATE, 
  tsLastModified TIMESTAMPTZ, 
  tsPersoLimit DATE, 
  tsPublication TIMESTAMPTZ, 
  tsReminder DATE, 
  tsStart DATE, 
  tsSubscriptionLimit DATE
);

CREATE UNIQUE INDEX NmsCentralCatalog_id ON NmsCentralCatalog(iCentralCatalogId);
CREATE UNIQUE INDEX NmsCentralCatalog_name ON NmsCentralCatalog(sName);
CREATE INDEX NmsCentralCatalog_orderFolder ON NmsCentralCatalog(iOrderFolderId);
CREATE INDEX NmsCentralCatalog_folderId ON NmsCentralCatalog(iFolderId);
CREATE INDEX NmsCentralCatalog_operationId ON NmsCentralCatalog(iOperationId);
CREATE INDEX NmsCentralCatalog_ownerId ON NmsCentralCatalog(iOwnerId);
CREATE INDEX NmsCentralCatalog_modifiedByI ON NmsCentralCatalog(iModifiedById);
CREATE INDEX NmsCentralCatalog_createdById ON NmsCentralCatalog(iCreatedById);
  
INSERT INTO NmsCentralCatalog (iCentralCatalogId) VALUES (0); 

-- Log: Creating table 'NmsCostCenter'


CREATE TABLE NmsCostCenter(
  iCostCenterId INTEGER NOT NULL Default 0, 
  iHidden SMALLINT NOT NULL Default 0, 
  iMandatory SMALLINT NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iSupplierModelId INTEGER NOT NULL Default 0, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX NmsCostCenter_id ON NmsCostCenter(iCostCenterId);
CREATE UNIQUE INDEX NmsCostCenter_name ON NmsCostCenter(sName);
CREATE INDEX NmsCostCenter_supplierModelId ON NmsCostCenter(iSupplierModelId);
  
INSERT INTO NmsCostCenter (iCostCenterId) VALUES (0); 

-- Log: Creating table 'NmsCostLine'


CREATE TABLE NmsCostLine(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iCategoryId INTEGER NOT NULL Default 0, 
  iCommitmentLevel SMALLINT NOT NULL Default 0, 
  iCostLineId INTEGER NOT NULL Default 0, 
  iCostStructureId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iExpenseLineId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iPlanId INTEGER NOT NULL Default 0, 
  iProgramId INTEGER NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  tsDate TIMESTAMPTZ
);

CREATE INDEX NmsCostLine_type ON NmsCostLine(iCommitmentLevel);
CREATE UNIQUE INDEX NmsCostLine_id ON NmsCostLine(iCostLineId);
CREATE INDEX NmsCostLine_planId ON NmsCostLine(iPlanId);
CREATE INDEX NmsCostLine_programId ON NmsCostLine(iProgramId);
CREATE INDEX NmsCostLine_operationId ON NmsCostLine(iOperationId);
CREATE INDEX NmsCostLine_categoryId ON NmsCostLine(iCategoryId);
CREATE INDEX NmsCostLine_costStructureId ON NmsCostLine(iCostStructureId);
CREATE INDEX NmsCostLine_expenseLineId ON NmsCostLine(iExpenseLineId);
CREATE INDEX NmsCostLine_budgetId ON NmsCostLine(iBudgetId);
CREATE INDEX NmsCostLine_deliveryId ON NmsCostLine(iDeliveryId);
CREATE INDEX NmsCostLine_taskId ON NmsCostLine(iTaskId);
  
INSERT INTO NmsCostLine (iCostLineId) VALUES (0); 

-- Log: Creating table 'NmsCostStructure'


CREATE TABLE NmsCostStructure(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iCostCenterId INTEGER NOT NULL Default 0, 
  iCostStructureId INTEGER NOT NULL Default 0, 
  iCostTypeId INTEGER NOT NULL Default 0, 
  iMessage SMALLINT NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iStructureType SMALLINT NOT NULL Default 0, 
  iSupplierId INTEGER NOT NULL Default 0, 
  iSupplierModelId INTEGER NOT NULL Default 0, 
  iUnit SMALLINT NOT NULL Default 0, 
  sLabel VARCHAR(128)
);

CREATE UNIQUE INDEX NmsCostStructure_id ON NmsCostStructure(iCostStructureId);
CREATE INDEX NmsCostStructure_costCenterId ON NmsCostStructure(iCostCenterId);
CREATE INDEX NmsCostStructure_costTypeId ON NmsCostStructure(iCostTypeId);
CREATE INDEX NmsCostStructure_supplierId ON NmsCostStructure(iSupplierId);
CREATE INDEX NmsCostStructure_supplierMode ON NmsCostStructure(iSupplierModelId);
  
INSERT INTO NmsCostStructure (iCostStructureId) VALUES (0); 

-- Log: Creating table 'NmsCostThreshold'


CREATE TABLE NmsCostThreshold(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iCostStructureId INTEGER NOT NULL Default 0, 
  iCostThresholdId INTEGER NOT NULL Default 0, 
  iThreshold INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsCostThreshold_id ON NmsCostThreshold(iCostThresholdId);
CREATE INDEX NmsCostThreshold_costStructur ON NmsCostThreshold(iCostStructureId);
  
INSERT INTO NmsCostThreshold (iCostThresholdId) VALUES (0); 

-- Log: Creating table 'NmsCostType'


CREATE TABLE NmsCostType(
  iCostCenterId INTEGER NOT NULL Default 0, 
  iCostTypeId INTEGER NOT NULL Default 0, 
  iSelected SMALLINT NOT NULL Default 0, 
  iStockLineId INTEGER NOT NULL Default 0, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX NmsCostType_id ON NmsCostType(iCostTypeId);
CREATE UNIQUE INDEX NmsCostType_name ON NmsCostType(sName);
CREATE INDEX NmsCostType_stockLineId ON NmsCostType(iStockLineId);
CREATE INDEX NmsCostType_costCenterId ON NmsCostType(iCostCenterId);
  
INSERT INTO NmsCostType (iCostTypeId) VALUES (0); 

-- Log: Creating table 'NmsCountry'


CREATE TABLE NmsCountry(
  iIsoNum INTEGER NOT NULL Default 0, 
  sIana VARCHAR(2), 
  sIsoA2 VARCHAR(2), 
  sIsoA3 VARCHAR(3), 
  sItu VARCHAR(4), 
  sLabelEN VARCHAR(80), 
  sLabelFR VARCHAR(80), 
  sLabelISO VARCHAR(80), 
  sPhoneExit VARCHAR(5), 
  sPhoneFormat VARCHAR(50)
);

CREATE UNIQUE INDEX NmsCountry_labelen ON NmsCountry(sLabelEN);
CREATE UNIQUE INDEX NmsCountry_labelfr ON NmsCountry(sLabelFR);
CREATE UNIQUE INDEX NmsCountry_isoA3 ON NmsCountry(sIsoA3);
CREATE UNIQUE INDEX NmsCountry_isoA2 ON NmsCountry(sIsoA2);
  
-- Log: Creating table 'NmsCoupon'


CREATE TABLE NmsCoupon(
  iBoolean1 SMALLINT NOT NULL Default 0, 
  iBoolean2 SMALLINT NOT NULL Default 0, 
  iBoolean3 SMALLINT NOT NULL Default 0, 
  iCouponId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  sCode VARCHAR(64), 
  sDesc VARCHAR(512), 
  sLabel VARCHAR(128), 
  sText1 VARCHAR(180), 
  sText2 VARCHAR(180), 
  sText3 VARCHAR(180), 
  sText4 VARCHAR(180), 
  sText5 VARCHAR(180), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE INDEX NmsCoupon_code ON NmsCoupon(sCode);
CREATE UNIQUE INDEX NmsCoupon_id ON NmsCoupon(iCouponId);
CREATE INDEX NmsCoupon_folderId ON NmsCoupon(iFolderId);
CREATE INDEX NmsCoupon_modifiedById ON NmsCoupon(iModifiedById);
CREATE INDEX NmsCoupon_createdById ON NmsCoupon(iCreatedById);
  
INSERT INTO NmsCoupon (iCouponId) VALUES (0); 

-- Log: Creating table 'NmsCouponValue'


CREATE TABLE NmsCouponValue(
  iCouponId INTEGER NOT NULL Default 0, 
  iMessageId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sCouponCode VARCHAR(64), 
  tsRedeemed TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsCouponValue_couponValue ON NmsCouponValue(iCouponId, sCouponCode);
CREATE INDEX NmsCouponValue_messageId ON NmsCouponValue(iMessageId);
  
-- Log: Creating table 'NmsCurrency'


CREATE TABLE NmsCurrency(
  dValue DOUBLE PRECISION NOT NULL Default 0, 
  iCurrencyId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sCode VARCHAR(3), 
  sImg VARCHAR(128), 
  sLabel VARCHAR(128), 
  tsDate TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsCurrency_id ON NmsCurrency(iCurrencyId);
  
INSERT INTO NmsCurrency (iCurrencyId) VALUES (0); 

-- Log: Creating table 'NmsDelivery'


CREATE TABLE NmsDelivery(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  dComputedCost DOUBLE PRECISION NOT NULL Default 0, 
  dDuration DOUBLE PRECISION NOT NULL Default 0, 
  dEstimatedCost DOUBLE PRECISION NOT NULL Default 0, 
  dPercentMargin DOUBLE PRECISION NOT NULL Default 0, 
  dRate DOUBLE PRECISION NOT NULL Default 0, 
  dRealCost DOUBLE PRECISION NOT NULL Default 0, 
  dResponseRatio DOUBLE PRECISION NOT NULL Default 0, 
  dRetryPeriod DOUBLE PRECISION, 
  dTotalEstimatedMargin DOUBLE PRECISION NOT NULL Default 0, 
  dTotalEstimatedRealized DOUBLE PRECISION NOT NULL Default 0, 
  dTotalMargin DOUBLE PRECISION NOT NULL Default 0, 
  dTotalRealized DOUBLE PRECISION NOT NULL Default 0, 
  dUnitaryCost DOUBLE PRECISION NOT NULL Default 0, 
  dUnitaryMargin DOUBLE PRECISION NOT NULL Default 0, 
  iAnalysisStep SMALLINT NOT NULL Default 0, 
  iArticle INTEGER NOT NULL Default 0, 
  iAssignEdition SMALLINT NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iBudgetStatus SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCommitmentLevel SMALLINT NOT NULL Default 0, 
  iComputationState SMALLINT NOT NULL Default 0, 
  iContentStatus SMALLINT NOT NULL Default 0, 
  iCouponId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCtrlGrpReject INTEGER NOT NULL Default 0, 
  iDelayed SMALLINT NOT NULL Default 0, 
  iDeleteStatus SMALLINT NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iDeliveryMode SMALLINT NOT NULL Default 0, 
  iDeliveryOutlineId INTEGER NOT NULL Default 0, 
  iDeliveryProviderId INTEGER NOT NULL Default 0, 
  iDirty SMALLINT NOT NULL Default 0, 
  iDisableNotification SMALLINT NOT NULL Default 0, 
  iDisabled INTEGER NOT NULL Default 0, 
  iError INTEGER NOT NULL Default 0, 
  iErrorPending INTEGER NOT NULL Default 0, 
  iExternalValidation SMALLINT NOT NULL Default 0, 
  iExtractionStatus SMALLINT NOT NULL Default 0, 
  iFCP SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iForecasted SMALLINT NOT NULL Default 0, 
  iForward INTEGER NOT NULL Default 0, 
  iHasAttachments SMALLINT NOT NULL Default 0, 
  iHtml INTEGER NOT NULL Default 0, 
  iImportReject INTEGER NOT NULL Default 0, 
  iInsertMode SMALLINT NOT NULL Default 0, 
  iInvalidDomain INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iLandingPageId INTEGER NOT NULL Default 0, 
  iLinkedDeliveryId INTEGER NOT NULL Default 0, 
  iMailboxFull INTEGER NOT NULL Default 0, 
  iMappingId INTEGER NOT NULL Default 0, 
  iMarginType SMALLINT NOT NULL Default 0, 
  iMaxRetry SMALLINT NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iMidRemoteId INTEGER NOT NULL Default 0, 
  iMidSourcing SMALLINT NOT NULL Default 0, 
  iMirrorPage INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iMsgPriority SMALLINT NOT NULL Default 0, 
  iMultipart INTEGER NOT NULL Default 0, 
  iNeedMirrorPage SMALLINT NOT NULL Default 0, 
  iNewQuarantine INTEGER NOT NULL Default 0, 
  iNotConnected INTEGER NOT NULL Default 0, 
  iOfferCategoryId INTEGER NOT NULL Default 0, 
  iOfferSpaceId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOptOut INTEGER NOT NULL Default 0, 
  iOwnerOperationId INTEGER NOT NULL Default 0, 
  iPersonClick INTEGER NOT NULL Default 0, 
  iPriority SMALLINT NOT NULL Default 0, 
  iProcessed INTEGER NOT NULL Default 0, 
  iProofedDeliveryId INTEGER NOT NULL Default 0, 
  iPropositionCount INTEGER NOT NULL Default 0, 
  iPublicationStatus SMALLINT NOT NULL Default 0, 
  iRecipientClick INTEGER NOT NULL Default 0, 
  iRecipientOpen INTEGER NOT NULL Default 0, 
  iRefused INTEGER NOT NULL Default 0, 
  iReject INTEGER NOT NULL Default 0, 
  iRetry SMALLINT NOT NULL Default 0, 
  iRoutingDeliveryId INTEGER NOT NULL Default 0, 
  iSandboxMode SMALLINT NOT NULL Default 0, 
  iSandboxStatus SMALLINT NOT NULL Default 0, 
  iSeedProcessed INTEGER NOT NULL Default 0, 
  iSent INTEGER NOT NULL Default 0, 
  iState SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iSuccess INTEGER NOT NULL Default 0, 
  iSupplierModelId INTEGER NOT NULL Default 0, 
  iTargetStatus SMALLINT NOT NULL Default 0, 
  iText INTEGER NOT NULL Default 0, 
  iToDeliver INTEGER NOT NULL Default 0, 
  iToValidate INTEGER NOT NULL Default 0, 
  iTotalRecipientClick INTEGER NOT NULL Default 0, 
  iTotalRecipientOpen INTEGER NOT NULL Default 0, 
  iTotalWebPage INTEGER NOT NULL Default 0, 
  iTrackingPending INTEGER NOT NULL Default 0, 
  iTransaction INTEGER NOT NULL Default 0, 
  iTypologyId INTEGER NOT NULL Default 0, 
  iUnknownUser INTEGER NOT NULL Default 0, 
  iUnreachable INTEGER NOT NULL Default 0, 
  iUrl INTEGER NOT NULL Default 0, 
  iUseBudgetValidation SMALLINT NOT NULL Default 0, 
  iUseContentValidation SMALLINT NOT NULL Default 0, 
  iUseExtractionValidation SMALLINT NOT NULL Default 0, 
  iUseFCPValidation SMALLINT NOT NULL Default 0, 
  iUseLinkedDeliveryValidation SMALLINT NOT NULL Default 0, 
  iUseTargetValidation SMALLINT NOT NULL Default 0, 
  iUseTaskCreation SMALLINT NOT NULL Default 0, 
  iValidationMode SMALLINT NOT NULL Default 0, 
  iWebPage INTEGER NOT NULL Default 0, 
  iWebResPurged SMALLINT NOT NULL Default 0, 
  iWeight INTEGER NOT NULL Default 0, 
  iWeightType SMALLINT NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sDeliveryCode VARCHAR(36), 
  sDesc VARCHAR(512), 
  sEventType VARCHAR(255), 
  sIPAffinity VARCHAR(64), 
  sInternalName VARCHAR(100), 
  sLabel VARCHAR(128), 
  sLogin VARCHAR(64), 
  sNature VARCHAR(64), 
  sPublishingName VARCHAR(80), 
  sPublishingNamespace VARCHAR(16), 
  sType VARCHAR(32), 
  sValidationMode VARCHAR(16), 
  sXtkschema VARCHAR(80), 
  tsBroadEnd TIMESTAMPTZ, 
  tsBroadStart TIMESTAMPTZ, 
  tsContact TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsDelete TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsExpectedBudget DATE, 
  tsExpectedContent DATE, 
  tsExpectedEdition DATE, 
  tsExpectedExternal DATE, 
  tsExpectedExtraction DATE, 
  tsExpectedFCP DATE, 
  tsExpectedForecast DATE, 
  tsExpectedTarget DATE, 
  tsExtracted TIMESTAMPTZ, 
  tsExtraction TIMESTAMPTZ, 
  tsLastComputed TIMESTAMPTZ, 
  tsLastErrorComputation TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsLastTrackingComputation TIMESTAMPTZ, 
  tsNextPass TIMESTAMPTZ, 
  tsPassStart TIMESTAMPTZ, 
  tsReminderBudget DATE, 
  tsReminderContent DATE, 
  tsReminderEdition DATE, 
  tsReminderExternal DATE, 
  tsReminderExtraction DATE, 
  tsReminderFCP DATE, 
  tsReminderForecast DATE, 
  tsReminderTarget DATE, 
  tsScenarioModTime TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ, 
  tsValidity TIMESTAMPTZ, 
  tsWebValidity TIMESTAMPTZ
);

CREATE INDEX NmsDelivery_midModified ON NmsDelivery(iDeliveryMode, tsLastModified);
CREATE INDEX NmsDelivery_deliveryCode ON NmsDelivery(sDeliveryCode);
CREATE INDEX NmsDelivery_lastModified ON NmsDelivery(iFolderId, tsLastModified);
CREATE INDEX NmsDelivery_lastModifiedFlat ON NmsDelivery(tsLastModified);
CREATE INDEX NmsDelivery_state ON NmsDelivery(iState);
CREATE INDEX NmsDelivery_label ON NmsDelivery(iBuiltIn, sLabel);
CREATE UNIQUE INDEX NmsDelivery_id ON NmsDelivery(iDeliveryId);
CREATE UNIQUE INDEX NmsDelivery_internalName ON NmsDelivery(sInternalName);
CREATE INDEX NmsDelivery_deliveryOutlineId ON NmsDelivery(iDeliveryOutlineId);
CREATE INDEX NmsDelivery_linkedDeliveryId ON NmsDelivery(iLinkedDeliveryId);
CREATE INDEX NmsDelivery_supplierModelId ON NmsDelivery(iSupplierModelId);
CREATE INDEX NmsDelivery_budgetId ON NmsDelivery(iBudgetId);
CREATE INDEX NmsDelivery_workflowId ON NmsDelivery(iWorkflowId);
CREATE INDEX NmsDelivery_routingDeliveryId ON NmsDelivery(iRoutingDeliveryId);
CREATE INDEX NmsDelivery_ownerOperationId ON NmsDelivery(iOwnerOperationId);
CREATE INDEX NmsDelivery_operationId ON NmsDelivery(iOperationId);
CREATE INDEX NmsDelivery_couponId ON NmsDelivery(iCouponId);
CREATE INDEX NmsDelivery_publishingNamespa ON NmsDelivery(sPublishingNamespace, sPublishingName);
CREATE INDEX NmsDelivery_landingPageId ON NmsDelivery(iLandingPageId);
CREATE INDEX NmsDelivery_offerCategoryId ON NmsDelivery(iOfferCategoryId);
CREATE INDEX NmsDelivery_offerSpaceId ON NmsDelivery(iOfferSpaceId);
CREATE INDEX NmsDelivery_proofedDeliveryId ON NmsDelivery(iProofedDeliveryId);
CREATE INDEX NmsDelivery_mappingId ON NmsDelivery(iMappingId);
CREATE INDEX NmsDelivery_typologyId ON NmsDelivery(iTypologyId);
CREATE INDEX NmsDelivery_deliveryProviderI ON NmsDelivery(iDeliveryProviderId);
CREATE INDEX NmsDelivery_modifiedById ON NmsDelivery(iModifiedById);
CREATE INDEX NmsDelivery_createdById ON NmsDelivery(iCreatedById);
CREATE INDEX NmsDelivery_folderProcessId ON NmsDelivery(iFolderProcessId);
  
INSERT INTO NmsDelivery (iDeliveryId) VALUES (0); 

-- Log: Creating table 'NmsDeliveryCustomization'


CREATE TABLE NmsDeliveryCustomization(
  iDeliveryCustomizationId INTEGER NOT NULL Default 0, 
  iDeliveryOutlineId INTEGER NOT NULL Default 0, 
  iDlvOutlineItemId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sValue VARCHAR(255)
);

CREATE UNIQUE INDEX NmsDeliveryCustomization_id ON NmsDeliveryCustomization(iDeliveryCustomizationId);
CREATE UNIQUE INDEX NmsDeliveryCustomization_name ON NmsDeliveryCustomization(sName);
CREATE INDEX NmsDeliveryCustomization_deli ON NmsDeliveryCustomization(iDeliveryOutlineId);
CREATE INDEX NmsDeliveryCustomization_fold ON NmsDeliveryCustomization(iFolderId);
CREATE INDEX NmsDeliveryCustomization_dlvO ON NmsDeliveryCustomization(iDlvOutlineItemId);
  
INSERT INTO NmsDeliveryCustomization (iDeliveryCustomizationId) VALUES (0); 

-- Log: Creating table 'NmsDeliveryMapping'


CREATE TABLE NmsDeliveryMapping(
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDeliveryMappingId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sBroadLogExclSchema VARCHAR(64), 
  sBroadLogSchema VARCHAR(64), 
  sFacebook VARCHAR(255), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sRecipientLink VARCHAR(64), 
  sSchema VARCHAR(64), 
  sTrackingLogSchema VARCHAR(64), 
  sTwitter VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsDeliveryMapping_id ON NmsDeliveryMapping(iDeliveryMappingId);
CREATE UNIQUE INDEX NmsDeliveryMapping_name ON NmsDeliveryMapping(sName);
CREATE INDEX NmsDeliveryMapping_folderId ON NmsDeliveryMapping(iFolderId);
CREATE INDEX NmsDeliveryMapping_modifiedBy ON NmsDeliveryMapping(iModifiedById);
CREATE INDEX NmsDeliveryMapping_createdByI ON NmsDeliveryMapping(iCreatedById);
  
INSERT INTO NmsDeliveryMapping (iDeliveryMappingId) VALUES (0); 

-- Log: Creating table 'NmsDeliveryOutline'


CREATE TABLE NmsDeliveryOutline(
  dEstimatedCost DOUBLE PRECISION NOT NULL Default 0, 
  iDeliveryOutlineId INTEGER NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  mDesc TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX NmsDeliveryOutline_id ON NmsDeliveryOutline(iDeliveryOutlineId);
CREATE UNIQUE INDEX NmsDeliveryOutline_name ON NmsDeliveryOutline(sName);
CREATE INDEX NmsDeliveryOutline_operationI ON NmsDeliveryOutline(iOperationId);
  
INSERT INTO NmsDeliveryOutline (iDeliveryOutlineId) VALUES (0); 

-- Log: Creating table 'NmsDeliveryPart'


CREATE TABLE NmsDeliveryPart(
  iDeliveryId INTEGER NOT NULL Default 0, 
  iDeliveryPartId INTEGER NOT NULL Default 0, 
  iNotificationId INTEGER NOT NULL Default 0, 
  iProcessId INTEGER NOT NULL Default 0, 
  iRcpCount INTEGER NOT NULL Default 0, 
  iRetry INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sHostname VARCHAR(64), 
  tsNextPass TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ, 
  tsValidity TIMESTAMPTZ
);

CREATE INDEX NmsDeliveryPart_state ON NmsDeliveryPart(iDeliveryId, tsNextPass);
CREATE UNIQUE INDEX NmsDeliveryPart_id ON NmsDeliveryPart(iDeliveryPartId);
  
INSERT INTO NmsDeliveryPart (iDeliveryPartId) VALUES (0); 

-- Log: Creating table 'NmsDeliveryStat'


CREATE TABLE NmsDeliveryStat(
  dVolume DOUBLE PRECISION NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFirstError INTEGER NOT NULL Default 0, 
  iFirstSuccess INTEGER NOT NULL Default 0, 
  iRetriesError INTEGER NOT NULL Default 0, 
  iRetriesSuccess INTEGER NOT NULL Default 0, 
  iVerifyMode SMALLINT NOT NULL Default 0, 
  tsDate TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsDeliveryStat_date ON NmsDeliveryStat(tsDate, iDeliveryId);
CREATE INDEX NmsDeliveryStat_deliveryId ON NmsDeliveryStat(iDeliveryId);
  
-- Log: Creating table 'NmsDlvExclusion'


CREATE TABLE NmsDlvExclusion(
  iCount INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iTypologyRuleId INTEGER NOT NULL Default 0, 
  tsApplied TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsDlvExclusion_id ON NmsDlvExclusion(iDeliveryId, iTypologyRuleId);
CREATE INDEX NmsDlvExclusion_typologyRuleI ON NmsDlvExclusion(iTypologyRuleId);
  
-- Log: Creating table 'NmsDlvOutlineItem'


CREATE TABLE NmsDlvOutlineItem(
  iAssetId INTEGER NOT NULL Default 0, 
  iDeliveryOutlineId INTEGER NOT NULL Default 0, 
  iDlvOutlineItemId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mDesc TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX NmsDlvOutlineItem_id ON NmsDlvOutlineItem(iDlvOutlineItemId);
CREATE UNIQUE INDEX NmsDlvOutlineItem_name ON NmsDlvOutlineItem(sName);
CREATE INDEX NmsDlvOutlineItem_deliveryOut ON NmsDlvOutlineItem(iDeliveryOutlineId);
CREATE INDEX NmsDlvOutlineItem_offerId ON NmsDlvOutlineItem(iOfferId);
CREATE INDEX NmsDlvOutlineItem_assetId ON NmsDlvOutlineItem(iAssetId);
  
INSERT INTO NmsDlvOutlineItem (iDlvOutlineItemId) VALUES (0); 

-- Log: Creating table 'NmsDlvSimuOverlap'


CREATE TABLE NmsDlvSimuOverlap(
  iCount INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iOverlapDeliveryId INTEGER NOT NULL Default 0, 
  iSimulationId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsDlvSimuOverlap_ ON NmsDlvSimuOverlap(iSimulationId, iDeliveryId, iOverlapDeliveryId);
CREATE INDEX NmsDlvSimuOverlap_overlapDeli ON NmsDlvSimuOverlap(iOverlapDeliveryId);
CREATE INDEX NmsDlvSimuOverlap_deliveryId ON NmsDlvSimuOverlap(iDeliveryId);
  
-- Log: Creating table 'NmsDlvSimulationRel'


CREATE TABLE NmsDlvSimulationRel(
  iDeliveryId INTEGER NOT NULL Default 0, 
  iInput INTEGER NOT NULL Default 0, 
  iOutput INTEGER NOT NULL Default 0, 
  iSimulationId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsDlvSimulationRel_id ON NmsDlvSimulationRel(iSimulationId, iDeliveryId);
CREATE INDEX NmsDlvSimulationRel_deliveryI ON NmsDlvSimulationRel(iDeliveryId);
  
-- Log: Creating table 'NmsDocument'


CREATE TABLE NmsDocument(
  iCentralCatalogId INTEGER NOT NULL Default 0, 
  iCodepage INTEGER NOT NULL Default 0, 
  iContainerId INTEGER NOT NULL Default 0, 
  iContentId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iDocumentId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iHeight INTEGER NOT NULL Default 0, 
  iLocalOrderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iPlanId INTEGER NOT NULL Default 0, 
  iPublish SMALLINT NOT NULL Default 0, 
  iResourceType SMALLINT NOT NULL Default 0, 
  iStorageType SMALLINT NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  iUseMd5AsFilename SMALLINT NOT NULL Default 0, 
  iWidth INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sAlt VARCHAR(64), 
  sContentType VARCHAR(100), 
  sFileName VARCHAR(255), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sMd5 VARCHAR(32), 
  sNature VARCHAR(64), 
  sOriginalName VARCHAR(255), 
  sOriginalServer VARCHAR(255), 
  sVersion VARCHAR(20), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsDocument_lastModified ON NmsDocument(iFolderId, tsLastModified);
CREATE UNIQUE INDEX NmsDocument_id ON NmsDocument(iDocumentId);
CREATE UNIQUE INDEX NmsDocument_name ON NmsDocument(sInternalName);
CREATE INDEX NmsDocument_localOrderId ON NmsDocument(iLocalOrderId);
CREATE INDEX NmsDocument_centralCatalogId ON NmsDocument(iCentralCatalogId);
CREATE INDEX NmsDocument_contentId ON NmsDocument(iContentId);
CREATE INDEX NmsDocument_taskId ON NmsDocument(iTaskId);
CREATE INDEX NmsDocument_deliveryId ON NmsDocument(iDeliveryId);
CREATE INDEX NmsDocument_planId ON NmsDocument(iPlanId);
CREATE INDEX NmsDocument_operationId ON NmsDocument(iOperationId);
CREATE INDEX NmsDocument_modifiedById ON NmsDocument(iModifiedById);
CREATE INDEX NmsDocument_createdById ON NmsDocument(iCreatedById);
CREATE INDEX NmsDocument_containerId ON NmsDocument(iContainerId);
  
INSERT INTO NmsDocument (iDocumentId) VALUES (0); 

-- Log: Creating table 'NmsDomain'


CREATE TABLE NmsDomain(
  sDomain VARCHAR(80)
);

CREATE UNIQUE INDEX NmsDomain_domain ON NmsDomain(sDomain);
  
-- Log: Creating table 'NmsEmailError'


CREATE TABLE NmsEmailError(
  iLastConnectionCode SMALLINT NOT NULL Default 0, 
  iLastReplyCode INTEGER NOT NULL Default 0, 
  iMXIP INTEGER NOT NULL Default 0, 
  iPublicId INTEGER NOT NULL Default 0, 
  sLastReplyMessage VARCHAR(512), 
  tsLast TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsEmailError_path ON NmsEmailError(iMXIP, iPublicId);
  
-- Log: Creating table 'NmsEmailErrorStat'


CREATE TABLE NmsEmailErrorStat(
  iAbortedConnections INTEGER NOT NULL Default 0, 
  iFailedConnections INTEGER NOT NULL Default 0, 
  iHitCount INTEGER NOT NULL Default 0, 
  iMXIP INTEGER NOT NULL Default 0, 
  iMessageErrors INTEGER NOT NULL Default 0, 
  iPublicId INTEGER NOT NULL Default 0, 
  iRefusedConnections INTEGER NOT NULL Default 0, 
  iSentMessages INTEGER NOT NULL Default 0, 
  iTimeoutConnections INTEGER NOT NULL Default 0, 
  iTotalConnections INTEGER NOT NULL Default 0, 
  iTotalErrors INTEGER NOT NULL Default 0, 
  tsDate TIMESTAMPTZ
);

CREATE INDEX NmsEmailErrorStat_mxip ON NmsEmailErrorStat(iMXIP);
CREATE INDEX NmsEmailErrorStat_date ON NmsEmailErrorStat(tsDate);
  
-- Log: Creating table 'NmsEmailOfferView'


CREATE TABLE NmsEmailOfferView(
  iEmailOfferViewId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iSpaceId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  tsPublication TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsEmailOfferView_id ON NmsEmailOfferView(iEmailOfferViewId);
CREATE UNIQUE INDEX NmsEmailOfferView_type ON NmsEmailOfferView(iOfferId, iSpaceId);
CREATE INDEX NmsEmailOfferView_spaceId ON NmsEmailOfferView(iSpaceId);
  
INSERT INTO NmsEmailOfferView (iEmailOfferViewId) VALUES (0); 

-- Log: Creating table 'NmsEventHisto'


CREATE TABLE NmsEventHisto(
  biEventHistoId BIGINT NOT NULL Default 0, 
  iAddrErrorCount INTEGER NOT NULL Default 0, 
  iAddrQuality INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iEmailFormat SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iWishedChannel SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sCountryCode VARCHAR(2), 
  sEmail VARCHAR(128), 
  sExternalId VARCHAR(64), 
  sLanguage VARCHAR(32), 
  sLine1 VARCHAR(80), 
  sLine2 VARCHAR(80), 
  sLine3 VARCHAR(80), 
  sLine4 VARCHAR(80), 
  sLine5 VARCHAR(80), 
  sLine6 VARCHAR(80), 
  sLine7 VARCHAR(80), 
  sMobilePhone VARCHAR(32), 
  sOrigin VARCHAR(64), 
  sType VARCHAR(64), 
  tsAddrLastCheck TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsExpiration TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsProcessed TIMESTAMPTZ, 
  tsProcessing TIMESTAMPTZ, 
  tsScheduled TIMESTAMPTZ, 
  tsSubmit TIMESTAMPTZ
);

CREATE INDEX NmsEventHisto_status ON NmsEventHisto(iStatus);
CREATE INDEX NmsEventHisto_type ON NmsEventHisto(sType);
CREATE INDEX NmsEventHisto_lastModified ON NmsEventHisto(tsLastModified);
CREATE UNIQUE INDEX NmsEventHisto_id ON NmsEventHisto(biEventHistoId);
CREATE INDEX NmsEventHisto_deliveryId ON NmsEventHisto(iDeliveryId);
  
-- Log: Creating table 'NmsExcludeLogRcp'


CREATE TABLE NmsExcludeLogRcp(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFlags SMALLINT NOT NULL Default 0, 
  iMsgId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sAddress VARCHAR(512), 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsExcludeLogRcp_recipient ON NmsExcludeLogRcp(iRecipientId, tsLastModified);
CREATE INDEX NmsExcludeLogRcp_lastModified ON NmsExcludeLogRcp(tsLastModified);
CREATE INDEX NmsExcludeLogRcp_delivery ON NmsExcludeLogRcp(iDeliveryId, tsLastModified);
CREATE UNIQUE INDEX NmsExcludeLogRcp_id ON NmsExcludeLogRcp(iBroadLogId);
  
INSERT INTO NmsExcludeLogRcp (iBroadLogId) VALUES (0); 

-- Log: Creating table 'NmsExpenseLine'


CREATE TABLE NmsExpenseLine(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iExpenseLineId INTEGER NOT NULL Default 0, 
  iInvoiceLineId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  tsDate TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsExpenseLine_id ON NmsExpenseLine(iExpenseLineId);
CREATE INDEX NmsExpenseLine_invoiceLineId ON NmsExpenseLine(iInvoiceLineId);
CREATE INDEX NmsExpenseLine_taskId ON NmsExpenseLine(iTaskId);
CREATE INDEX NmsExpenseLine_operationId ON NmsExpenseLine(iOperationId);
CREATE INDEX NmsExpenseLine_deliveryId ON NmsExpenseLine(iDeliveryId);
CREATE INDEX NmsExpenseLine_budgetId ON NmsExpenseLine(iBudgetId);
  
INSERT INTO NmsExpenseLine (iExpenseLineId) VALUES (0); 

-- Log: Creating table 'NmsExtAccount'


CREATE TABLE NmsExtAccount(
  iActive SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDeliveryMode SMALLINT NOT NULL Default 0, 
  iDeployed SMALLINT NOT NULL Default 0, 
  iEMailFunction SMALLINT NOT NULL Default 0, 
  iEncryptionType SMALLINT NOT NULL Default 0, 
  iExtAccountId INTEGER NOT NULL Default 0, 
  iFdaExtAccountId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderSetOfServicesId INTEGER NOT NULL Default 0, 
  iMcHistoMethod SMALLINT NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iMultiMidProvider SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iUnicode SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sAccount VARCHAR(80), 
  sDbName VARCHAR(255), 
  sLabel VARCHAR(128), 
  sLastMultiUsed VARCHAR(64), 
  sMirrorURL VARCHAR(255), 
  sName VARCHAR(64), 
  sPassword VARCHAR(64), 
  sPort VARCHAR(20), 
  sProvider VARCHAR(255), 
  sServer VARCHAR(80), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsExtAccount_id ON NmsExtAccount(iExtAccountId);
CREATE UNIQUE INDEX NmsExtAccount_name ON NmsExtAccount(sName);
CREATE INDEX NmsExtAccount_fdaExtAccountId ON NmsExtAccount(iFdaExtAccountId);
CREATE INDEX NmsExtAccount_folderSetOfServ ON NmsExtAccount(iFolderSetOfServicesId);
CREATE INDEX NmsExtAccount_folderId ON NmsExtAccount(iFolderId);
CREATE INDEX NmsExtAccount_modifiedById ON NmsExtAccount(iModifiedById);
CREATE INDEX NmsExtAccount_createdById ON NmsExtAccount(iCreatedById);
  
INSERT INTO NmsExtAccount (iExtAccountId) VALUES (0); 

-- Log: Creating table 'NmsFriendshipRel'


CREATE TABLE NmsFriendshipRel(
  iFriendId INTEGER NOT NULL Default 0, 
  iFriendOfId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsFriendshipRel_id ON NmsFriendshipRel(iFriendOfId, iFriendId);
CREATE INDEX NmsFriendshipRel_friendId ON NmsFriendshipRel(iFriendId);
  
-- Log: Creating table 'NmsGroup'


CREATE TABLE NmsGroup(
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCollectLineNumber SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCreatedFrom SMALLINT NOT NULL Default 0, 
  iDeleteStatus SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iGroupId INTEGER NOT NULL Default 0, 
  iImportStatus SMALLINT NOT NULL Default 0, 
  iLineCount INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iRejectCount SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sAcquisitionType VARCHAR(64), 
  sDesc VARCHAR(512), 
  sFileMd5 VARCHAR(32), 
  sImportEventParticipation VARCHAR(64), 
  sImportSource VARCHAR(64), 
  sImportType VARCHAR(64), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sProvider VARCHAR(80), 
  sSchema VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsDelete TIMESTAMPTZ, 
  tsImport TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsGroup_label ON NmsGroup(iFolderId, sLabel);
CREATE UNIQUE INDEX NmsGroup_id ON NmsGroup(iGroupId);
CREATE UNIQUE INDEX NmsGroup_name ON NmsGroup(sName);
CREATE INDEX NmsGroup_operationId ON NmsGroup(iOperationId);
CREATE INDEX NmsGroup_workflowId ON NmsGroup(iWorkflowId);
CREATE INDEX NmsGroup_modifiedById ON NmsGroup(iModifiedById);
CREATE INDEX NmsGroup_createdById ON NmsGroup(iCreatedById);
  
INSERT INTO NmsGroup (iGroupId) VALUES (0); 

-- Log: Creating table 'NmsInSMS'


CREATE TABLE NmsInSMS(
  iCountryCode INTEGER NOT NULL Default 0, 
  iExtAccountId INTEGER NOT NULL Default 0, 
  iInSMSId INTEGER NOT NULL Default 0, 
  iOperatorCode INTEGER NOT NULL Default 0, 
  sAlias VARCHAR(64), 
  sLargeAccount VARCHAR(64), 
  sMessage VARCHAR(255), 
  sOrigin VARCHAR(32), 
  sProviderId VARCHAR(64), 
  sSeparator VARCHAR(8), 
  tsCreated TIMESTAMPTZ, 
  tsDelivery TIMESTAMPTZ, 
  tsMessage TIMESTAMPTZ, 
  tsReceival TIMESTAMPTZ
);

CREATE INDEX NmsInSMS_created ON NmsInSMS(tsCreated);
CREATE UNIQUE INDEX NmsInSMS_id ON NmsInSMS(iInSMSId);
CREATE INDEX NmsInSMS_extAccountId ON NmsInSMS(iExtAccountId);
  
INSERT INTO NmsInSMS (iInSMSId) VALUES (0); 

-- Log: Creating table 'NmsIncludeView'


CREATE TABLE NmsIncludeView(
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iIncludeViewId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iVisible SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsIncludeView_id ON NmsIncludeView(iIncludeViewId);
CREATE UNIQUE INDEX NmsIncludeView_name ON NmsIncludeView(sName);
CREATE INDEX NmsIncludeView_folderId ON NmsIncludeView(iFolderId);
CREATE INDEX NmsIncludeView_modifiedById ON NmsIncludeView(iModifiedById);
CREATE INDEX NmsIncludeView_createdById ON NmsIncludeView(iCreatedById);
  
INSERT INTO NmsIncludeView (iIncludeViewId) VALUES (0); 

-- Log: Creating table 'NmsInterest'


CREATE TABLE NmsInterest(
  iInterestId INTEGER NOT NULL Default 0, 
  iOrigin SMALLINT NOT NULL Default 0, 
  sCategory VARCHAR(128), 
  sExternalId VARCHAR(64), 
  sLabel VARCHAR(128)
);

CREATE UNIQUE INDEX NmsInterest_id ON NmsInterest(iInterestId);
CREATE UNIQUE INDEX NmsInterest_externalId ON NmsInterest(iOrigin, sExternalId);
  
INSERT INTO NmsInterest (iInterestId) VALUES (0); 

-- Log: Creating table 'NmsInvoice'


CREATE TABLE NmsInvoice(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  dSettledAmount DOUBLE PRECISION NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iInvoiceId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iSupplierId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsDate DATE, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsInvoice_id ON NmsInvoice(iInvoiceId);
CREATE UNIQUE INDEX NmsInvoice_name ON NmsInvoice(sName);
CREATE INDEX NmsInvoice_folderId ON NmsInvoice(iFolderId);
CREATE INDEX NmsInvoice_budgetId ON NmsInvoice(iBudgetId);
CREATE INDEX NmsInvoice_supplierId ON NmsInvoice(iSupplierId);
CREATE INDEX NmsInvoice_modifiedById ON NmsInvoice(iModifiedById);
CREATE INDEX NmsInvoice_createdById ON NmsInvoice(iCreatedById);
  
INSERT INTO NmsInvoice (iInvoiceId) VALUES (0); 

-- Log: Creating table 'NmsInvoiceLine'


CREATE TABLE NmsInvoiceLine(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iInvoiceId INTEGER NOT NULL Default 0, 
  iInvoiceLineId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOrderId INTEGER NOT NULL Default 0, 
  iSettled SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsInvoiceLine_id ON NmsInvoiceLine(iInvoiceLineId);
CREATE UNIQUE INDEX NmsInvoiceLine_name ON NmsInvoiceLine(sName);
CREATE INDEX NmsInvoiceLine_orderId ON NmsInvoiceLine(iOrderId);
CREATE INDEX NmsInvoiceLine_invoiceId ON NmsInvoiceLine(iInvoiceId);
CREATE INDEX NmsInvoiceLine_modifiedById ON NmsInvoiceLine(iModifiedById);
CREATE INDEX NmsInvoiceLine_createdById ON NmsInvoiceLine(iCreatedById);
  
INSERT INTO NmsInvoiceLine (iInvoiceLineId) VALUES (0); 

-- Log: Creating table 'NmsLastDlvSnapshot'


CREATE TABLE NmsLastDlvSnapshot(
  iDeliveryId INTEGER NOT NULL Default 0, 
  iError INTEGER NOT NULL Default 0, 
  iOptOut INTEGER NOT NULL Default 0, 
  iSent INTEGER NOT NULL Default 0, 
  iTotalRecipientClick INTEGER NOT NULL Default 0, 
  iTotalRecipientOpen INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsLastDlvSnapshot_key ON NmsLastDlvSnapshot(iDeliveryId);
  
-- Log: Creating table 'NmsLocalCatalogRel'


CREATE TABLE NmsLocalCatalogRel(
  iCentralCatalogId INTEGER NOT NULL Default 0, 
  iLocalOrgUnitId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsLocalCatalogRel_id ON NmsLocalCatalogRel(iCentralCatalogId, iLocalOrgUnitId);
CREATE INDEX NmsLocalCatalogRel_localOrgUn ON NmsLocalCatalogRel(iLocalOrgUnitId);
  
-- Log: Creating table 'NmsLocalDistribution'


CREATE TABLE NmsLocalDistribution(
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iLocalDistributionId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sDeliveryLabelExpr VARCHAR(128), 
  sDistributionXPath VARCHAR(128), 
  sGroupXPath VARCHAR(128), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sTargetSchema VARCHAR(80), 
  sValidationSchema VARCHAR(80), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsLocalDistribution_id ON NmsLocalDistribution(iLocalDistributionId);
CREATE UNIQUE INDEX NmsLocalDistribution_name ON NmsLocalDistribution(sName);
CREATE INDEX NmsLocalDistribution_folderId ON NmsLocalDistribution(iFolderId);
CREATE INDEX NmsLocalDistribution_webAppId ON NmsLocalDistribution(iWebAppId);
CREATE INDEX NmsLocalDistribution_modified ON NmsLocalDistribution(iModifiedById);
CREATE INDEX NmsLocalDistribution_createdB ON NmsLocalDistribution(iCreatedById);
  
INSERT INTO NmsLocalDistribution (iLocalDistributionId) VALUES (0); 

-- Log: Creating table 'NmsLocalDistributionVal'


CREATE TABLE NmsLocalDistributionVal(
  dPercent DOUBLE PRECISION NOT NULL Default 0, 
  iAssigneeId INTEGER NOT NULL Default 0, 
  iFixed INTEGER NOT NULL Default 0, 
  iLocalDistributionId INTEGER NOT NULL Default 0, 
  iLocalDistributionValId INTEGER NOT NULL Default 0, 
  sLabel VARCHAR(255), 
  sValue VARCHAR(128)
);

CREATE UNIQUE INDEX NmsLocalDistributionVal_id ON NmsLocalDistributionVal(iLocalDistributionValId);
CREATE INDEX NmsLocalDistributionVal_local ON NmsLocalDistributionVal(iLocalDistributionId);
CREATE INDEX NmsLocalDistributionVal_assig ON NmsLocalDistributionVal(iAssigneeId);
  
INSERT INTO NmsLocalDistributionVal (iLocalDistributionValId) VALUES (0); 

-- Log: Creating table 'NmsLocalOrder'


CREATE TABLE NmsLocalOrder(
  iAvailable SMALLINT NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iCatalogId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCreationStatus SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iLocalOrderId INTEGER NOT NULL Default 0, 
  iLocalOrgUnitId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iProgramId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsEnd DATE, 
  tsExpectedValidation DATE, 
  tsLastModified TIMESTAMPTZ, 
  tsReminder DATE, 
  tsStart DATE
);

CREATE UNIQUE INDEX NmsLocalOrder_id ON NmsLocalOrder(iLocalOrderId);
CREATE UNIQUE INDEX NmsLocalOrder_name ON NmsLocalOrder(sName);
CREATE INDEX NmsLocalOrder_folderId ON NmsLocalOrder(iFolderId);
CREATE INDEX NmsLocalOrder_operationId ON NmsLocalOrder(iOperationId);
CREATE INDEX NmsLocalOrder_localOrgUnitId ON NmsLocalOrder(iLocalOrgUnitId);
CREATE INDEX NmsLocalOrder_catalogId ON NmsLocalOrder(iCatalogId);
CREATE INDEX NmsLocalOrder_budgetId ON NmsLocalOrder(iBudgetId);
CREATE INDEX NmsLocalOrder_programId ON NmsLocalOrder(iProgramId);
CREATE INDEX NmsLocalOrder_ownerId ON NmsLocalOrder(iOwnerId);
CREATE INDEX NmsLocalOrder_modifiedById ON NmsLocalOrder(iModifiedById);
CREATE INDEX NmsLocalOrder_createdById ON NmsLocalOrder(iCreatedById);
  
INSERT INTO NmsLocalOrder (iLocalOrderId) VALUES (0); 

-- Log: Creating table 'NmsLocalOrgUnit'


CREATE TABLE NmsLocalOrgUnit(
  iFolderId INTEGER NOT NULL Default 0, 
  iGroupId INTEGER NOT NULL Default 0, 
  iLocalOrgUnitId INTEGER NOT NULL Default 0, 
  iOperationValidationId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sAddress1 VARCHAR(80), 
  sAddress2 VARCHAR(80), 
  sAddress3 VARCHAR(80), 
  sAddress4 VARCHAR(80), 
  sCity VARCHAR(75), 
  sCountryCode VARCHAR(3), 
  sEmail VARCHAR(128), 
  sFax VARCHAR(32), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sPhone VARCHAR(32), 
  sStateCode VARCHAR(3), 
  sUrl VARCHAR(255), 
  sZipCode VARCHAR(20)
);

CREATE UNIQUE INDEX NmsLocalOrgUnit_id ON NmsLocalOrgUnit(iLocalOrgUnitId);
CREATE UNIQUE INDEX NmsLocalOrgUnit_name ON NmsLocalOrgUnit(sName);
CREATE INDEX NmsLocalOrgUnit_folderId ON NmsLocalOrgUnit(iFolderId);
CREATE INDEX NmsLocalOrgUnit_operationVali ON NmsLocalOrgUnit(iOperationValidationId);
CREATE INDEX NmsLocalOrgUnit_groupId ON NmsLocalOrgUnit(iGroupId);
  
INSERT INTO NmsLocalOrgUnit (iLocalOrgUnitId) VALUES (0); 

-- Log: Creating table 'NmsLocalValidationLog'


CREATE TABLE NmsLocalValidationLog(
  iLocalDistributionValId INTEGER NOT NULL Default 0, 
  iLocalValidationTaskId INTEGER NOT NULL Default 0, 
  iQuantity INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iValidatedById INTEGER NOT NULL Default 0, 
  iValidatedNumber INTEGER NOT NULL Default 0, 
  mComment TEXT, 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsValidated TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsLocalValidationLog_id ON NmsLocalValidationLog(iLocalValidationTaskId, iLocalDistributionValId);
CREATE INDEX NmsLocalValidationLog_validat ON NmsLocalValidationLog(iValidatedById);
  
-- Log: Creating table 'NmsLocalValidationRcp'


CREATE TABLE NmsLocalValidationRcp(
  iLocalDistributionValId INTEGER NOT NULL Default 0, 
  iLocalValidationTaskId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iValidation SMALLINT NOT NULL Default 0
);

CREATE UNIQUE INDEX sLocalValidationRcp_validation ON NmsLocalValidationRcp(iLocalValidationTaskId, iLocalDistributionValId, iRecipientId);
CREATE INDEX NmsLocalValidationRcp_recipie ON NmsLocalValidationRcp(iRecipientId);
  
-- Log: Creating table 'NmsLocalValidationTask'


CREATE TABLE NmsLocalValidationTask(
  iDeliveryId INTEGER NOT NULL Default 0, 
  iLocalDistributionId INTEGER NOT NULL Default 0, 
  iLocalValidationTaskId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iQuantity INTEGER NOT NULL Default 0, 
  iTaskIdentifier INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsExpected DATE, 
  tsLastModified TIMESTAMPTZ, 
  tsReminder DATE
);

CREATE UNIQUE INDEX NmsLocalValidationTask_id ON NmsLocalValidationTask(iLocalValidationTaskId);
CREATE UNIQUE INDEX NmsLocalValidationTask_ ON NmsLocalValidationTask(iWorkflowId, iTaskIdentifier);
CREATE INDEX NmsLocalValidationTask_localD ON NmsLocalValidationTask(iLocalDistributionId);
CREATE INDEX NmsLocalValidationTask_operat ON NmsLocalValidationTask(iOperationId);
CREATE INDEX NmsLocalValidationTask_delive ON NmsLocalValidationTask(iDeliveryId);
  
INSERT INTO NmsLocalValidationTask (iLocalValidationTaskId) VALUES (0); 

-- Log: Creating table 'NmsMirrorPageInfo'


CREATE TABLE NmsMirrorPageInfo(
  iDeliveryId INTEGER NOT NULL Default 0, 
  iMirrorPageInfoId INTEGER NOT NULL Default 0, 
  mData TEXT
);

CREATE UNIQUE INDEX NmsMirrorPageInfo_id ON NmsMirrorPageInfo(iMirrorPageInfoId);
CREATE INDEX NmsMirrorPageInfo_deliveryId ON NmsMirrorPageInfo(iDeliveryId);
  
-- Log: Creating table 'NmsMirrorPageSearch'


CREATE TABLE NmsMirrorPageSearch(
  iDeliveryId INTEGER NOT NULL Default 0, 
  iMessageId INTEGER NOT NULL Default 0, 
  iMirrorPageInfoId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsMirrorPageSearch_messageId ON NmsMirrorPageSearch(iMessageId);
CREATE INDEX NmsMirrorPageSearch_deliveryI ON NmsMirrorPageSearch(iDeliveryId);
  
-- Log: Creating table 'NmsMobileOfferView'


CREATE TABLE NmsMobileOfferView(
  iMobileOfferViewId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iSpaceId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  tsPublication TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsMobileOfferView_id ON NmsMobileOfferView(iMobileOfferViewId);
CREATE UNIQUE INDEX NmsMobileOfferView_type ON NmsMobileOfferView(iOfferId, iSpaceId);
CREATE INDEX NmsMobileOfferView_spaceId ON NmsMobileOfferView(iSpaceId);
  
INSERT INTO NmsMobileOfferView (iMobileOfferViewId) VALUES (0); 

-- Log: Creating table 'NmsMxDomain'


CREATE TABLE NmsMxDomain(
  iHitCount INTEGER NOT NULL Default 0, 
  iMXIP INTEGER NOT NULL Default 0, 
  sDomain VARCHAR(80), 
  sMX VARCHAR(80)
);

CREATE UNIQUE INDEX NmsMxDomain_path ON NmsMxDomain(iMXIP, sDomain);
  
-- Log: Creating table 'NmsMxOwner'


CREATE TABLE NmsMxOwner(
  iMXIP INTEGER NOT NULL Default 0, 
  sOwner VARCHAR(80)
);

CREATE UNIQUE INDEX NmsMxOwner_ip ON NmsMxOwner(iMXIP);
  
-- Log: Creating table 'NmsNewsgroup'


CREATE TABLE NmsNewsgroup(
  iAssetId INTEGER NOT NULL Default 0, 
  iCentralCatalogId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iLinkedId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iNewsgroupId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iPlanId INTEGER NOT NULL Default 0, 
  iSimulationId INTEGER NOT NULL Default 0, 
  iStockId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sSubject VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsNewsgroup_id ON NmsNewsgroup(iNewsgroupId);
CREATE INDEX NmsNewsgroup_centralCatalogId ON NmsNewsgroup(iCentralCatalogId);
CREATE INDEX NmsNewsgroup_simulationId ON NmsNewsgroup(iSimulationId);
CREATE INDEX NmsNewsgroup_stockId ON NmsNewsgroup(iStockId);
CREATE INDEX NmsNewsgroup_assetId ON NmsNewsgroup(iAssetId);
CREATE INDEX NmsNewsgroup_operationId ON NmsNewsgroup(iOperationId);
CREATE INDEX NmsNewsgroup_planId ON NmsNewsgroup(iPlanId);
CREATE INDEX NmsNewsgroup_linkedId ON NmsNewsgroup(iLinkedId);
CREATE INDEX NmsNewsgroup_modifiedById ON NmsNewsgroup(iModifiedById);
CREATE INDEX NmsNewsgroup_createdById ON NmsNewsgroup(iCreatedById);
  
INSERT INTO NmsNewsgroup (iNewsgroupId) VALUES (0); 

-- Log: Creating table 'NmsObjective'


CREATE TABLE NmsObjective(
  dValue DOUBLE PRECISION NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iDeliveryOutlineId INTEGER NOT NULL Default 0, 
  iObjectiveId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iPlanId INTEGER NOT NULL Default 0, 
  iProgramId INTEGER NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  iTypeId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsObjective_id ON NmsObjective(iObjectiveId);
CREATE INDEX NmsObjective_deliveryOutlineI ON NmsObjective(iDeliveryOutlineId);
CREATE INDEX NmsObjective_taskId ON NmsObjective(iTaskId);
CREATE INDEX NmsObjective_deliveryId ON NmsObjective(iDeliveryId);
CREATE INDEX NmsObjective_operationId ON NmsObjective(iOperationId);
CREATE INDEX NmsObjective_programId ON NmsObjective(iProgramId);
CREATE INDEX NmsObjective_planId ON NmsObjective(iPlanId);
CREATE INDEX NmsObjective_typeId ON NmsObjective(iTypeId);
  
INSERT INTO NmsObjective (iObjectiveId) VALUES (0); 

-- Log: Creating table 'NmsOffer'


CREATE TABLE NmsOffer(
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCategoryId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sCode VARCHAR(64), 
  sDesc VARCHAR(512), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sTargetSchema VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsExpectedValidation DATE, 
  tsLastModified TIMESTAMPTZ, 
  tsReminder DATE, 
  tsStart TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsOffer_id ON NmsOffer(iOfferId);
CREATE UNIQUE INDEX NmsOffer_name ON NmsOffer(sName);
CREATE INDEX NmsOffer_categoryId ON NmsOffer(iCategoryId);
CREATE INDEX NmsOffer_ownerId ON NmsOffer(iOwnerId);
CREATE INDEX NmsOffer_modifiedById ON NmsOffer(iModifiedById);
CREATE INDEX NmsOffer_createdById ON NmsOffer(iCreatedById);
  
INSERT INTO NmsOffer (iOfferId) VALUES (0); 

-- Log: Creating table 'NmsOfferContext'


CREATE TABLE NmsOfferContext(
  iActive SMALLINT NOT NULL Default 0, 
  iOfferContextId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iSpaceId INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sActivity VARCHAR(64), 
  sDesc VARCHAR(512), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsEnd TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsOfferContext_id ON NmsOfferContext(iOfferContextId);
CREATE UNIQUE INDEX NmsOfferContext_name ON NmsOfferContext(iOfferId, sName);
CREATE INDEX NmsOfferContext_workflowId ON NmsOfferContext(iWorkflowId);
CREATE INDEX NmsOfferContext_spaceId ON NmsOfferContext(iSpaceId);
  
INSERT INTO NmsOfferContext (iOfferContextId) VALUES (0); 

-- Log: Creating table 'NmsOfferSimulationRel'


CREATE TABLE NmsOfferSimulationRel(
  iCategoryId INTEGER NOT NULL Default 0, 
  iCount INTEGER NOT NULL Default 0, 
  iCountPos1 INTEGER NOT NULL Default 0, 
  iCountPos2 INTEGER NOT NULL Default 0, 
  iCountPos3 INTEGER NOT NULL Default 0, 
  iCountPos4 INTEGER NOT NULL Default 0, 
  iCountPos5 INTEGER NOT NULL Default 0, 
  iMax INTEGER NOT NULL Default 0, 
  iMin INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iSimulationId INTEGER NOT NULL Default 0, 
  iSum INTEGER NOT NULL Default 0, 
  sFullName VARCHAR(255)
);

CREATE UNIQUE INDEX NmsOfferSimulationRel_id ON NmsOfferSimulationRel(iSimulationId, iOfferId);
CREATE INDEX NmsOfferSimulationRel_offerId ON NmsOfferSimulationRel(iOfferId);
CREATE INDEX NmsOfferSimulationRel_categor ON NmsOfferSimulationRel(iCategoryId);
  
-- Log: Creating table 'NmsOfferSpace'


CREATE TABLE NmsOfferSpace(
  iChannel SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDefaultStatus SMALLINT NOT NULL Default 0, 
  iDisablePropositionStorage SMALLINT NOT NULL Default 0, 
  iEnvId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOfferSpaceId INTEGER NOT NULL Default 0, 
  iUseBuildPropositionsScript SMALLINT NOT NULL Default 0, 
  iUseTargetScript SMALLINT NOT NULL Default 0, 
  mBuildPropositions TEXT, 
  mData TEXT, 
  mLibrary TEXT, 
  mPostBuildPropositions TEXT, 
  mTarget TEXT, 
  sDesc VARCHAR(512), 
  sInputSchema VARCHAR(64), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sOutputSchema VARCHAR(64), 
  sRandomizeAlternativeContents VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsOfferSpace_id ON NmsOfferSpace(iOfferSpaceId);
CREATE UNIQUE INDEX NmsOfferSpace_name ON NmsOfferSpace(iEnvId, sName);
CREATE INDEX NmsOfferSpace_folderId ON NmsOfferSpace(iFolderId);
CREATE INDEX NmsOfferSpace_modifiedById ON NmsOfferSpace(iModifiedById);
CREATE INDEX NmsOfferSpace_createdById ON NmsOfferSpace(iCreatedById);
  
INSERT INTO NmsOfferSpace (iOfferSpaceId) VALUES (0); 

-- Log: Creating table 'NmsOperation'


CREATE TABLE NmsOperation(
  dComputedCost DOUBLE PRECISION NOT NULL Default 0, 
  dDuration DOUBLE PRECISION, 
  dEstimatedCost DOUBLE PRECISION NOT NULL Default 0, 
  dFixedCost DOUBLE PRECISION NOT NULL Default 0, 
  dPeriodCovered DOUBLE PRECISION, 
  dRealCost DOUBLE PRECISION NOT NULL Default 0, 
  iAssignEdition SMALLINT NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iBudgetStatus SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCancelState SMALLINT NOT NULL Default 0, 
  iCentralControl SMALLINT NOT NULL Default 0, 
  iCentralLocalType SMALLINT NOT NULL Default 0, 
  iCommitmentLevel SMALLINT NOT NULL Default 0, 
  iComputationState SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDisableNotification SMALLINT NOT NULL Default 0, 
  iExternalValidation SMALLINT NOT NULL Default 0, 
  iFcpGroupId INTEGER NOT NULL Default 0, 
  iForecasted SMALLINT NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iLinkedOperationId INTEGER NOT NULL Default 0, 
  iLocalOrgUnitId INTEGER NOT NULL Default 0, 
  iMainDlvTemplateId INTEGER NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iNbDocument SMALLINT NOT NULL Default 0, 
  iNbValidation SMALLINT NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iParticipative SMALLINT NOT NULL Default 0, 
  iPriority SMALLINT NOT NULL Default 0, 
  iProgramId INTEGER NOT NULL Default 0, 
  iProgramProcessId INTEGER NOT NULL Default 0, 
  iSandboxMode SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iUseBudget SMALLINT NOT NULL Default 0, 
  iUseBudgetValidation SMALLINT NOT NULL Default 0, 
  iUseCentralLocal SMALLINT NOT NULL Default 0, 
  iUseContentValidation SMALLINT NOT NULL Default 0, 
  iUseExtractionValidation SMALLINT NOT NULL Default 0, 
  iUseFCPValidation SMALLINT NOT NULL Default 0, 
  iUseLinkedDeliveryValidation SMALLINT NOT NULL Default 0, 
  iUseTargetValidation SMALLINT NOT NULL Default 0, 
  iUseTask SMALLINT NOT NULL Default 0, 
  iUseTaskCreation SMALLINT NOT NULL Default 0, 
  iValidationMode SMALLINT NOT NULL Default 0, 
  iWebAppType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sEmailRtEvent VARCHAR(128), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLogin VARCHAR(64), 
  sMobilePhoneRtEvent VARCHAR(32), 
  sNature VARCHAR(64), 
  sWebSegment VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsEnd DATE, 
  tsLastComputed TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsStart DATE
);

CREATE UNIQUE INDEX NmsOperation_id ON NmsOperation(iOperationId);
CREATE UNIQUE INDEX NmsOperation_name ON NmsOperation(sInternalName);
CREATE INDEX NmsOperation_fcpGroupId ON NmsOperation(iFcpGroupId);
CREATE INDEX NmsOperation_programProcessId ON NmsOperation(iProgramProcessId);
CREATE INDEX NmsOperation_programId ON NmsOperation(iProgramId);
CREATE INDEX NmsOperation_linkedOperationI ON NmsOperation(iLinkedOperationId);
CREATE INDEX NmsOperation_budgetId ON NmsOperation(iBudgetId);
CREATE INDEX NmsOperation_mainDlvTemplateI ON NmsOperation(iMainDlvTemplateId);
CREATE INDEX NmsOperation_localOrgUnitId ON NmsOperation(iLocalOrgUnitId);
CREATE INDEX NmsOperation_ownerId ON NmsOperation(iOwnerId);
CREATE INDEX NmsOperation_modifiedById ON NmsOperation(iModifiedById);
CREATE INDEX NmsOperation_createdById ON NmsOperation(iCreatedById);
  
INSERT INTO NmsOperation (iOperationId) VALUES (0); 

-- Log: Creating table 'NmsOperationLog'


CREATE TABLE NmsOperationLog(
  iCreatedById INTEGER NOT NULL Default 0, 
  iLocalOrderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOperationLogId INTEGER NOT NULL Default 0, 
  iRemaHypothesisId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  sMessage VARCHAR(512), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsOperationLog_id ON NmsOperationLog(iOperationLogId);
CREATE INDEX NmsOperationLog_localOrderId ON NmsOperationLog(iLocalOrderId);
CREATE INDEX NmsOperationLog_remaHypothesi ON NmsOperationLog(iRemaHypothesisId);
CREATE INDEX NmsOperationLog_operationId ON NmsOperationLog(iOperationId);
CREATE INDEX NmsOperationLog_modifiedById ON NmsOperationLog(iModifiedById);
CREATE INDEX NmsOperationLog_createdById ON NmsOperationLog(iCreatedById);
  
INSERT INTO NmsOperationLog (iOperationLogId) VALUES (0); 

-- Log: Creating table 'NmsOperationPlanning'


CREATE TABLE NmsOperationPlanning(
  dDuration DOUBLE PRECISION, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOperationInstanceId INTEGER NOT NULL Default 0, 
  iOperationPlanningId INTEGER NOT NULL Default 0, 
  iToStart SMALLINT NOT NULL Default 0, 
  iToValidate SMALLINT NOT NULL Default 0, 
  iWorkflowInstanceId INTEGER NOT NULL Default 0, 
  tsEnd DATE, 
  tsStart DATE
);

CREATE UNIQUE INDEX NmsOperationPlanning_id ON NmsOperationPlanning(iOperationPlanningId);
CREATE UNIQUE INDEX NmsOperationPlanning_operation ON NmsOperationPlanning(iOperationId, tsStart);
CREATE INDEX NmsOperationPlanning_operatio1 ON NmsOperationPlanning(iOperationInstanceId);
CREATE INDEX NmsOperationPlanning_workflow ON NmsOperationPlanning(iWorkflowInstanceId);
  
INSERT INTO NmsOperationPlanning (iOperationPlanningId) VALUES (0); 

-- Log: Creating table 'NmsOrder'


CREATE TABLE NmsOrder(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOrderId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iSupplierId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sName VARCHAR(64), 
  sPaymentType VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsDate DATE, 
  tsExpiration DATE, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsOrder_id ON NmsOrder(iOrderId);
CREATE UNIQUE INDEX NmsOrder_name ON NmsOrder(sName);
CREATE INDEX NmsOrder_folderId ON NmsOrder(iFolderId);
CREATE INDEX NmsOrder_supplierId ON NmsOrder(iSupplierId);
CREATE INDEX NmsOrder_modifiedById ON NmsOrder(iModifiedById);
CREATE INDEX NmsOrder_createdById ON NmsOrder(iCreatedById);
  
INSERT INTO NmsOrder (iOrderId) VALUES (0); 

-- Log: Creating table 'NmsPaperOfferView'


CREATE TABLE NmsPaperOfferView(
  iOfferId INTEGER NOT NULL Default 0, 
  iPaperOfferViewId INTEGER NOT NULL Default 0, 
  iSpaceId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  tsPublication TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsPaperOfferView_id ON NmsPaperOfferView(iPaperOfferViewId);
CREATE UNIQUE INDEX NmsPaperOfferView_type ON NmsPaperOfferView(iOfferId, iSpaceId);
CREATE INDEX NmsPaperOfferView_spaceId ON NmsPaperOfferView(iSpaceId);
  
INSERT INTO NmsPaperOfferView (iPaperOfferViewId) VALUES (0); 

-- Log: Creating table 'NmsPredictiveModel'


CREATE TABLE NmsPredictiveModel(
  dBudget DOUBLE PRECISION NOT NULL Default 0, 
  dDeliveryCost DOUBLE PRECISION NOT NULL Default 0, 
  dKi DOUBLE PRECISION NOT NULL Default 0, 
  dKr DOUBLE PRECISION NOT NULL Default 0, 
  dQuality DOUBLE PRECISION NOT NULL Default 0, 
  dRecords DOUBLE PRECISION NOT NULL Default 0, 
  dRobustness DOUBLE PRECISION NOT NULL Default 0, 
  dTargets DOUBLE PRECISION NOT NULL Default 0, 
  dTransactionAmount DOUBLE PRECISION NOT NULL Default 0, 
  iAlgorithm SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iPredictiveModelId INTEGER NOT NULL Default 0, 
  iState SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sDesc VARCHAR(512), 
  sInternalName VARCHAR(100), 
  sLabel VARCHAR(128), 
  sSchema VARCHAR(64), 
  sTargetCategory VARCHAR(255), 
  sType VARCHAR(32), 
  sXtkschema VARCHAR(80), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE INDEX NmsPredictiveModel_state ON NmsPredictiveModel(iState);
CREATE INDEX NmsPredictiveModel_label ON NmsPredictiveModel(iBuiltIn, sLabel);
CREATE UNIQUE INDEX NmsPredictiveModel_id ON NmsPredictiveModel(iPredictiveModelId);
CREATE UNIQUE INDEX msPredictiveModel_internalName ON NmsPredictiveModel(sInternalName);
CREATE INDEX NmsPredictiveModel_modifiedBy ON NmsPredictiveModel(iModifiedById);
CREATE INDEX NmsPredictiveModel_createdByI ON NmsPredictiveModel(iCreatedById);
CREATE INDEX NmsPredictiveModel_folderProc ON NmsPredictiveModel(iFolderProcessId);
CREATE INDEX NmsPredictiveModel_folderId ON NmsPredictiveModel(iFolderId);
  
INSERT INTO NmsPredictiveModel (iPredictiveModelId) VALUES (0); 

-- Log: Creating table 'NmsPropositionRcp'


CREATE TABLE NmsPropositionRcp(
  dWeight DOUBLE PRECISION NOT NULL Default 0, 
  iBroadLogId INTEGER NOT NULL Default 0, 
  iInteractionId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iOfferSpaceId INTEGER NOT NULL Default 0, 
  iPropositionId INTEGER NOT NULL Default 0, 
  iRank SMALLINT NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsPropositionRcp_eventDate ON NmsPropositionRcp(tsEvent);
CREATE INDEX NmsPropositionRcp_lastModified ON NmsPropositionRcp(tsLastModified);
CREATE UNIQUE INDEX NmsPropositionRcp_id ON NmsPropositionRcp(iPropositionId);
CREATE INDEX NmsPropositionRcp_broadLogId ON NmsPropositionRcp(iBroadLogId);
CREATE INDEX NmsPropositionRcp_recipientId ON NmsPropositionRcp(iRecipientId);
CREATE INDEX NmsPropositionRcp_offerSpaceI ON NmsPropositionRcp(iOfferSpaceId);
CREATE INDEX NmsPropositionRcp_offerId ON NmsPropositionRcp(iOfferId);
  
INSERT INTO NmsPropositionRcp (iPropositionId) VALUES (0); 

-- Log: Creating table 'NmsPropositionVisitor'


CREATE TABLE NmsPropositionVisitor(
  dWeight DOUBLE PRECISION NOT NULL Default 0, 
  iInteractionId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iOfferSpaceId INTEGER NOT NULL Default 0, 
  iPropositionId INTEGER NOT NULL Default 0, 
  iRank SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iVisitorId INTEGER NOT NULL Default 0, 
  tsEvent TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX msPropositionVisitor_eventDate ON NmsPropositionVisitor(tsEvent);
CREATE INDEX ropositionVisitor_lastModified ON NmsPropositionVisitor(tsLastModified);
CREATE UNIQUE INDEX NmsPropositionVisitor_id ON NmsPropositionVisitor(iPropositionId);
CREATE INDEX NmsPropositionVisitor_visitor ON NmsPropositionVisitor(iVisitorId);
CREATE INDEX NmsPropositionVisitor_offerSp ON NmsPropositionVisitor(iOfferSpaceId);
CREATE INDEX NmsPropositionVisitor_offerId ON NmsPropositionVisitor(iOfferId);
  
INSERT INTO NmsPropositionVisitor (iPropositionId) VALUES (0); 

-- Log: Creating table 'NmsProviderMsgId'


CREATE TABLE NmsProviderMsgId(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  sProviderId VARCHAR(64), 
  tsCreated TIMESTAMPTZ
);

CREATE INDEX NmsProviderMsgId_created ON NmsProviderMsgId(tsCreated);
CREATE INDEX NmsProviderMsgId_broadLogId ON NmsProviderMsgId(iBroadLogId);
CREATE UNIQUE INDEX NmsProviderMsgId_id ON NmsProviderMsgId(sProviderId);
  
-- Log: Creating table 'NmsPurl'


CREATE TABLE NmsPurl(
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iModelId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOriginId INTEGER NOT NULL Default 0, 
  iProtocol SMALLINT NOT NULL Default 0, 
  iPurlId INTEGER NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sCategory VARCHAR(100), 
  sDomain VARCHAR(64), 
  sGuestCodeExpr VARCHAR(128), 
  sGuestIdExpr VARCHAR(128), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sPath VARCHAR(64), 
  sSchema VARCHAR(64), 
  sSubDomain VARCHAR(64), 
  sUrl VARCHAR(255), 
  sUrlTemplate VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsPurl_id ON NmsPurl(iPurlId);
CREATE UNIQUE INDEX NmsPurl_name ON NmsPurl(sName);
CREATE INDEX NmsPurl_modelId ON NmsPurl(iModelId);
CREATE INDEX NmsPurl_originId ON NmsPurl(iOriginId);
CREATE INDEX NmsPurl_webAppId ON NmsPurl(iWebAppId);
CREATE INDEX NmsPurl_folderProcessId ON NmsPurl(iFolderProcessId);
CREATE INDEX NmsPurl_folderId ON NmsPurl(iFolderId);
CREATE INDEX NmsPurl_modifiedById ON NmsPurl(iModifiedById);
CREATE INDEX NmsPurl_createdById ON NmsPurl(iCreatedById);
  
INSERT INTO NmsPurl (iPurlId) VALUES (0); 

-- Log: Creating table 'NmsRcpGrpRel'


CREATE TABLE NmsRcpGrpRel(
  iGroupId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsRcpGrpRel_id ON NmsRcpGrpRel(iGroupId, iRecipientId);
CREATE INDEX NmsRcpGrpRel_recipientId ON NmsRcpGrpRel(iRecipientId);
  
-- Log: Creating table 'NmsRecipient'


CREATE TABLE NmsRecipient(
  iAddrErrorCount INTEGER NOT NULL Default 0, 
  iAddrQuality INTEGER NOT NULL Default 0, 
  iBlackList SMALLINT NOT NULL Default 0, 
  iBlackListEmail SMALLINT NOT NULL Default 0, 
  iBlackListFax SMALLINT NOT NULL Default 0, 
  iBlackListMobile SMALLINT NOT NULL Default 0, 
  iBlackListPhone SMALLINT NOT NULL Default 0, 
  iBlackListPostalMail SMALLINT NOT NULL Default 0, 
  iBoolean1 SMALLINT NOT NULL Default 0, 
  iBoolean2 SMALLINT NOT NULL Default 0, 
  iBoolean3 SMALLINT NOT NULL Default 0, 
  iCompanyId INTEGER NOT NULL Default 0, 
  iCrmInstanceId INTEGER NOT NULL Default 0, 
  iEmailFormat SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iGender SMALLINT NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iPrimaryLeadId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iSalesAccountId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sAccount VARCHAR(30), 
  sAddress1 VARCHAR(255), 
  sAddress2 VARCHAR(255), 
  sAddress3 VARCHAR(255), 
  sAddress4 VARCHAR(80), 
  sCity VARCHAR(120), 
  sCountryCode VARCHAR(3), 
  sCrmContactId VARCHAR(36), 
  sCrmOwnerId VARCHAR(36), 
  sCrmSalesAccountId VARCHAR(36), 
  sDepartment VARCHAR(120), 
  sEmail VARCHAR(128), 
  sFax VARCHAR(120), 
  sFirstName VARCHAR(120), 
  sHomePhone VARCHAR(120), 
  sJobTitle VARCHAR(120), 
  sLanguage VARCHAR(32), 
  sLastName VARCHAR(240), 
  sMiddleName VARCHAR(30), 
  sMobilePhone VARCHAR(120), 
  sOrigin VARCHAR(80), 
  sPhone VARCHAR(120), 
  sSalutation VARCHAR(100), 
  sStateCode VARCHAR(3), 
  sText1 VARCHAR(180), 
  sText2 VARCHAR(180), 
  sText3 VARCHAR(180), 
  sText4 VARCHAR(180), 
  sText5 VARCHAR(180), 
  sZipCode VARCHAR(60), 
  tsAddrLastCheck TIMESTAMPTZ, 
  tsBirth DATE, 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsRecipient_crmContactId ON NmsRecipient(sCrmContactId);
CREATE INDEX NmsRecipient_names ON NmsRecipient(sLastName, sFirstName);
CREATE INDEX NmsRecipient_email2 ON NmsRecipient(sEmail);
CREATE INDEX NmsRecipient_origin ON NmsRecipient(iFolderId, sOrigin);
CREATE INDEX NmsRecipient_lastModified ON NmsRecipient(iFolderId, tsLastModified);
CREATE INDEX NmsRecipient_mobilePhone ON NmsRecipient(iFolderId, sMobilePhone);
CREATE INDEX NmsRecipient_email ON NmsRecipient(iFolderId, sEmail);
CREATE INDEX NmsRecipient_account ON NmsRecipient(iFolderId, sAccount);
CREATE INDEX NmsRecipient_lastName ON NmsRecipient(iFolderId, sLastName);
CREATE UNIQUE INDEX NmsRecipient_id ON NmsRecipient(iRecipientId);
CREATE INDEX NmsRecipient_primaryLeadId ON NmsRecipient(iPrimaryLeadId);
CREATE INDEX NmsRecipient_ownerId ON NmsRecipient(iOwnerId);
CREATE INDEX NmsRecipient_salesAccountId ON NmsRecipient(iSalesAccountId);
CREATE INDEX NmsRecipient_companyId ON NmsRecipient(iCompanyId);
  
INSERT INTO NmsRecipient (iRecipientId) VALUES (0); 

-- Log: Creating table 'NmsRelAsset'


CREATE TABLE NmsRelAsset(
  iAssetId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iPlanId INTEGER NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0
);

CREATE INDEX NmsRelAsset_taskId ON NmsRelAsset(iTaskId);
CREATE INDEX NmsRelAsset_deliveryId ON NmsRelAsset(iDeliveryId);
CREATE INDEX NmsRelAsset_assetId ON NmsRelAsset(iAssetId);
CREATE INDEX NmsRelAsset_operationId ON NmsRelAsset(iOperationId);
CREATE INDEX NmsRelAsset_planId ON NmsRelAsset(iPlanId);
  
-- Log: Creating table 'NmsRemaHypothesis'


CREATE TABLE NmsRemaHypothesis(
  dContactReactedRate DOUBLE PRECISION NOT NULL Default 0, 
  dContactReactedTotalAmount DOUBLE PRECISION NOT NULL Default 0, 
  dContactReactedTotalMargin DOUBLE PRECISION NOT NULL Default 0, 
  dEndDelay DOUBLE PRECISION, 
  dProofReactedRate DOUBLE PRECISION NOT NULL Default 0, 
  dProofReactedTotalAmount DOUBLE PRECISION NOT NULL Default 0, 
  dProofReactedTotalMargin DOUBLE PRECISION NOT NULL Default 0, 
  dStartDelay DOUBLE PRECISION, 
  iAutoCalculation SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iContactReacted INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iForecasted SMALLINT NOT NULL Default 0, 
  iHypothesisType SMALLINT NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iLogSql SMALLINT NOT NULL Default 0, 
  iMeasureType SMALLINT NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iPriority SMALLINT NOT NULL Default 0, 
  iProofReacted INTEGER NOT NULL Default 0, 
  iPropositionStatus SMALLINT NOT NULL Default 0, 
  iRemaHypothesisId INTEGER NOT NULL Default 0, 
  iSetPropositionStatus SMALLINT NOT NULL Default 0, 
  iSignificativity SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iTransaction INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sDesc VARCHAR(512), 
  sEditForm VARCHAR(80), 
  sForm VARCHAR(80), 
  sImg VARCHAR(80), 
  sInternalName VARCHAR(100), 
  sLabel VARCHAR(128), 
  sLogin VARCHAR(64), 
  sNature VARCHAR(64), 
  sType VARCHAR(32), 
  sXtkschema VARCHAR(80), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsLastRun TIMESTAMPTZ, 
  tsNextRun TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE INDEX NmsRemaHypothesis_label ON NmsRemaHypothesis(iBuiltIn, sLabel);
CREATE UNIQUE INDEX NmsRemaHypothesis_id ON NmsRemaHypothesis(iRemaHypothesisId);
CREATE UNIQUE INDEX NmsRemaHypothesis_internalName ON NmsRemaHypothesis(sInternalName);
CREATE INDEX NmsRemaHypothesis_offerId ON NmsRemaHypothesis(iOfferId);
CREATE INDEX NmsRemaHypothesis_operationId ON NmsRemaHypothesis(iOperationId);
CREATE INDEX NmsRemaHypothesis_deliveryId ON NmsRemaHypothesis(iDeliveryId);
CREATE INDEX NmsRemaHypothesis_modifiedByI ON NmsRemaHypothesis(iModifiedById);
CREATE INDEX NmsRemaHypothesis_createdById ON NmsRemaHypothesis(iCreatedById);
CREATE INDEX NmsRemaHypothesis_folderProce ON NmsRemaHypothesis(iFolderProcessId);
CREATE INDEX NmsRemaHypothesis_folderId ON NmsRemaHypothesis(iFolderId);
  
INSERT INTO NmsRemaHypothesis (iRemaHypothesisId) VALUES (0); 

-- Log: Creating table 'NmsRemaMatchRcp'


CREATE TABLE NmsRemaMatchRcp(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iControlGroup SMALLINT NOT NULL Default 0, 
  iHypothesisId INTEGER NOT NULL Default 0, 
  iPropositionId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsRemaMatchRcp_match ON NmsRemaMatchRcp(iHypothesisId);
CREATE INDEX NmsRemaMatchRcp_broadLogId ON NmsRemaMatchRcp(iBroadLogId);
CREATE INDEX NmsRemaMatchRcp_propositionId ON NmsRemaMatchRcp(iPropositionId);
  
-- Log: Creating table 'NmsRtEvent'


CREATE TABLE NmsRtEvent(
  iAddrErrorCount INTEGER NOT NULL Default 0, 
  iAddrQuality INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iEmailFormat SMALLINT NOT NULL Default 0, 
  iRtEventId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iWishedChannel SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sCountryCode VARCHAR(2), 
  sEmail VARCHAR(128), 
  sExternalId VARCHAR(64), 
  sLanguage VARCHAR(32), 
  sLine1 VARCHAR(80), 
  sLine2 VARCHAR(80), 
  sLine3 VARCHAR(80), 
  sLine4 VARCHAR(80), 
  sLine5 VARCHAR(80), 
  sLine6 VARCHAR(80), 
  sLine7 VARCHAR(80), 
  sMobilePhone VARCHAR(32), 
  sOrigin VARCHAR(64), 
  sType VARCHAR(64), 
  tsAddrLastCheck TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsExpiration TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsProcessed TIMESTAMPTZ, 
  tsProcessing TIMESTAMPTZ, 
  tsScheduled TIMESTAMPTZ, 
  tsSubmit TIMESTAMPTZ
);

CREATE INDEX NmsRtEvent_status ON NmsRtEvent(iStatus);
CREATE INDEX NmsRtEvent_type ON NmsRtEvent(sType);
CREATE INDEX NmsRtEvent_lastModified ON NmsRtEvent(tsLastModified);
CREATE UNIQUE INDEX NmsRtEvent_id ON NmsRtEvent(iRtEventId);
CREATE INDEX NmsRtEvent_deliveryId ON NmsRtEvent(iDeliveryId);
  
INSERT INTO NmsRtEvent (iRtEventId) VALUES (0); 

-- Log: Creating table 'NmsRuleSet'


CREATE TABLE NmsRuleSet(
  iActive SMALLINT NOT NULL Default 0, 
  iMode SMALLINT NOT NULL Default 0, 
  iRuleSetId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX NmsRuleSet_id ON NmsRuleSet(iRuleSetId);
CREATE UNIQUE INDEX NmsRuleSet_name ON NmsRuleSet(sName);
  
INSERT INTO NmsRuleSet (iRuleSetId) VALUES (0); 

-- Log: Creating table 'NmsSeedMember'


CREATE TABLE NmsSeedMember(
  iBlackList SMALLINT NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iGender SMALLINT NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iProofId INTEGER NOT NULL Default 0, 
  iSeedMemberId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sAccount VARCHAR(30), 
  sAddress VARCHAR(512), 
  sCity VARCHAR(75), 
  sCompany VARCHAR(80), 
  sCountryCode VARCHAR(3), 
  sEmail VARCHAR(128), 
  sEmailRtEvent VARCHAR(128), 
  sFax VARCHAR(32), 
  sFirstName VARCHAR(30), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLanguage VARCHAR(32), 
  sLastName VARCHAR(50), 
  sLine1 VARCHAR(80), 
  sLine2 VARCHAR(80), 
  sLine3 VARCHAR(80), 
  sLine4 VARCHAR(80), 
  sLine5 VARCHAR(80), 
  sLine6 VARCHAR(80), 
  sLine7 VARCHAR(80), 
  sMiddleName VARCHAR(30), 
  sMobilePhone VARCHAR(32), 
  sMobilePhoneRtEvent VARCHAR(32), 
  sOrigin VARCHAR(80), 
  sPhone VARCHAR(32), 
  sSalutation VARCHAR(20), 
  sStateCode VARCHAR(3), 
  sZipCode VARCHAR(20), 
  tsBirth DATE
);

CREATE UNIQUE INDEX NmsSeedMember_id ON NmsSeedMember(iSeedMemberId);
CREATE UNIQUE INDEX NmsSeedMember_name ON NmsSeedMember(sInternalName);
CREATE INDEX NmsSeedMember_folderId ON NmsSeedMember(iFolderId);
CREATE INDEX NmsSeedMember_proofId ON NmsSeedMember(iProofId);
CREATE INDEX NmsSeedMember_deliveryId ON NmsSeedMember(iDeliveryId);
  
INSERT INTO NmsSeedMember (iSeedMemberId) VALUES (0); 

-- Log: Creating table 'NmsService'


CREATE TABLE NmsService(
  iAudience INTEGER NOT NULL Default 0, 
  iBoolean1 SMALLINT NOT NULL Default 0, 
  iBoolean2 SMALLINT NOT NULL Default 0, 
  iBoolean3 SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iIsPublic SMALLINT NOT NULL Default 0, 
  iMode SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iSubScenarioId INTEGER NOT NULL Default 0, 
  iSyncSubscription SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iUnlimited SMALLINT NOT NULL Default 0, 
  iUnsubScenarioId INTEGER NOT NULL Default 0, 
  sAccessToken VARCHAR(250), 
  sAccessTokenSecret VARCHAR(250), 
  sCategory VARCHAR(128), 
  sConsumerKey VARCHAR(250), 
  sConsumerSecret VARCHAR(250), 
  sDesc VARCHAR(512), 
  sExternalId VARCHAR(64), 
  sExternalPicture VARCHAR(128), 
  sExternalUrl VARCHAR(128), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sText1 VARCHAR(180), 
  sText2 VARCHAR(180), 
  sText3 VARCHAR(180), 
  sText4 VARCHAR(180), 
  sText5 VARCHAR(180), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsValidity DOUBLE PRECISION
);

CREATE INDEX NmsService_label ON NmsService(sLabel);
CREATE INDEX NmsService_externalKey ON NmsService(sExternalId, iFolderId);
CREATE UNIQUE INDEX NmsService_id ON NmsService(iServiceId);
CREATE UNIQUE INDEX NmsService_name ON NmsService(sName);
CREATE INDEX NmsService_folderId ON NmsService(iFolderId);
CREATE INDEX NmsService_unsubScenarioId ON NmsService(iUnsubScenarioId);
CREATE INDEX NmsService_subScenarioId ON NmsService(iSubScenarioId);
CREATE INDEX NmsService_modifiedById ON NmsService(iModifiedById);
CREATE INDEX NmsService_createdById ON NmsService(iCreatedById);
  
INSERT INTO NmsService (iServiceId) VALUES (0); 

-- Log: Creating table 'NmsSimulation'


CREATE TABLE NmsSimulation(
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCategoryId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iForecasted SMALLINT NOT NULL Default 0, 
  iGenerateOverlappingStats SMALLINT NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iKeepDetails SMALLINT NOT NULL Default 0, 
  iLogSql SMALLINT NOT NULL Default 0, 
  iMaxPropositionCount INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iPriority SMALLINT NOT NULL Default 0, 
  iReportId INTEGER NOT NULL Default 0, 
  iSimulatedPropositions INTEGER NOT NULL Default 0, 
  iSimulationId INTEGER NOT NULL Default 0, 
  iSpaceId INTEGER NOT NULL Default 0, 
  iStartPending SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iTargetSize INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sDesc VARCHAR(512), 
  sEditForm VARCHAR(80), 
  sForm VARCHAR(80), 
  sHumanCond VARCHAR(255), 
  sImg VARCHAR(80), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLogin VARCHAR(64), 
  sSchema VARCHAR(255), 
  sXtkschema VARCHAR(80), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsOfferEnd DATE, 
  tsOfferStart DATE, 
  tsStart TIMESTAMPTZ
);

CREATE INDEX NmsSimulation_status ON NmsSimulation(iStatus);
CREATE INDEX NmsSimulation_label ON NmsSimulation(iBuiltIn, sLabel);
CREATE UNIQUE INDEX NmsSimulation_id ON NmsSimulation(iSimulationId);
CREATE UNIQUE INDEX NmsSimulation_internalName ON NmsSimulation(sInternalName);
CREATE INDEX NmsSimulation_reportId ON NmsSimulation(iReportId);
CREATE INDEX NmsSimulation_spaceId ON NmsSimulation(iSpaceId);
CREATE INDEX NmsSimulation_categoryId ON NmsSimulation(iCategoryId);
CREATE INDEX NmsSimulation_modifiedById ON NmsSimulation(iModifiedById);
CREATE INDEX NmsSimulation_createdById ON NmsSimulation(iCreatedById);
CREATE INDEX NmsSimulation_folderProcessId ON NmsSimulation(iFolderProcessId);
CREATE INDEX NmsSimulation_folderId ON NmsSimulation(iFolderId);
  
INSERT INTO NmsSimulation (iSimulationId) VALUES (0); 

-- Log: Creating table 'NmsState'


CREATE TABLE NmsState(
  iRegion SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  sCode VARCHAR(3), 
  sCountryCode VARCHAR(2), 
  sLabelEN VARCHAR(80), 
  sLabelFR VARCHAR(80)
);

CREATE UNIQUE INDEX NmsState_labelen ON NmsState(sLabelEN);
CREATE UNIQUE INDEX NmsState_labelfr ON NmsState(sLabelFR);
CREATE UNIQUE INDEX NmsState_code ON NmsState(sCode, sCountryCode);
  
-- Log: Creating table 'NmsStock'


CREATE TABLE NmsStock(
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iGroupId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iStockId INTEGER NOT NULL Default 0, 
  iSubstituteStockId INTEGER NOT NULL Default 0, 
  iSupplierId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sNature VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsStock_id ON NmsStock(iStockId);
CREATE UNIQUE INDEX NmsStock_name ON NmsStock(sName);
CREATE INDEX NmsStock_folderId ON NmsStock(iFolderId);
CREATE INDEX NmsStock_substituteStockId ON NmsStock(iSubstituteStockId);
CREATE INDEX NmsStock_supplierId ON NmsStock(iSupplierId);
CREATE INDEX NmsStock_groupId ON NmsStock(iGroupId);
CREATE INDEX NmsStock_modifiedById ON NmsStock(iModifiedById);
CREATE INDEX NmsStock_createdById ON NmsStock(iCreatedById);
CREATE INDEX NmsStock_ownerId ON NmsStock(iOwnerId);
  
INSERT INTO NmsStock (iStockId) VALUES (0); 

-- Log: Creating table 'NmsStockLine'


CREATE TABLE NmsStockLine(
  iAlertLevel INTEGER NOT NULL Default 0, 
  iAssetId INTEGER NOT NULL Default 0, 
  iConsumed INTEGER NOT NULL Default 0, 
  iConsumedQty INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iHistorized SMALLINT NOT NULL Default 0, 
  iImputationId INTEGER NOT NULL Default 0, 
  iInitial INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOrderedQty INTEGER NOT NULL Default 0, 
  iStockId INTEGER NOT NULL Default 0, 
  iStockLineId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsDate TIMESTAMPTZ, 
  tsDelivery DATE
);

CREATE UNIQUE INDEX NmsStockLine_id ON NmsStockLine(iStockLineId);
CREATE UNIQUE INDEX NmsStockLine_name ON NmsStockLine(sName);
CREATE INDEX NmsStockLine_imputationId ON NmsStockLine(iImputationId);
CREATE INDEX NmsStockLine_assetId ON NmsStockLine(iAssetId);
CREATE INDEX NmsStockLine_deliveryId ON NmsStockLine(iDeliveryId);
CREATE INDEX NmsStockLine_operationId ON NmsStockLine(iOperationId);
CREATE INDEX NmsStockLine_stockId ON NmsStockLine(iStockId);
  
INSERT INTO NmsStockLine (iStockLineId) VALUES (0); 

-- Log: Creating table 'NmsSubHisto'


CREATE TABLE NmsSubHisto(
  iAction SMALLINT NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iSubHistoId INTEGER NOT NULL Default 0, 
  tsDate TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsSubHisto_id ON NmsSubHisto(iSubHistoId);
CREATE INDEX NmsSubHisto_serviceId ON NmsSubHisto(iServiceId);
CREATE INDEX NmsSubHisto_recipientId ON NmsSubHisto(iRecipientId);
  
INSERT INTO NmsSubHisto (iSubHistoId) VALUES (0); 

-- Log: Creating table 'NmsSubscription'


CREATE TABLE NmsSubscription(
  iConfirmationId INTEGER NOT NULL Default 0, 
  iDeleteStatus SMALLINT NOT NULL Default 0, 
  iEmailFormat SMALLINT NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  sAddressSpecific VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsExpiration DATE
);

CREATE INDEX NmsSubscription_recipient ON NmsSubscription(iRecipientId, sAddressSpecific);
CREATE INDEX NmsSubscription_confirmationId ON NmsSubscription(iConfirmationId);
CREATE UNIQUE INDEX NmsSubscription_subscription ON NmsSubscription(iServiceId, iRecipientId);
  
-- Log: Creating table 'NmsSupplier'


CREATE TABLE NmsSupplier(
  iFolderId INTEGER NOT NULL Default 0, 
  iLinkedSupplierId INTEGER NOT NULL Default 0, 
  iSupplierId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sAddress1 VARCHAR(80), 
  sAddress2 VARCHAR(80), 
  sAddress3 VARCHAR(80), 
  sAddress4 VARCHAR(80), 
  sCity VARCHAR(75), 
  sCountryCode VARCHAR(3), 
  sEmail VARCHAR(128), 
  sFax VARCHAR(32), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sNature VARCHAR(64), 
  sPhone VARCHAR(32), 
  sStateCode VARCHAR(3), 
  sUrl VARCHAR(255), 
  sZipCode VARCHAR(20)
);

CREATE UNIQUE INDEX NmsSupplier_id ON NmsSupplier(iSupplierId);
CREATE UNIQUE INDEX NmsSupplier_name ON NmsSupplier(sName);
CREATE INDEX NmsSupplier_folderId ON NmsSupplier(iFolderId);
CREATE INDEX NmsSupplier_linkedSupplierId ON NmsSupplier(iLinkedSupplierId);
  
INSERT INTO NmsSupplier (iSupplierId) VALUES (0); 

-- Log: Creating table 'NmsSupplierModel'


CREATE TABLE NmsSupplierModel(
  iDeliveryModelId INTEGER NOT NULL Default 0, 
  iGroupId INTEGER NOT NULL Default 0, 
  iSupplierId INTEGER NOT NULL Default 0, 
  iSupplierModelId INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX NmsSupplierModel_id ON NmsSupplierModel(iSupplierModelId);
CREATE UNIQUE INDEX NmsSupplierModel_name ON NmsSupplierModel(sName);
CREATE INDEX NmsSupplierModel_supplierId ON NmsSupplierModel(iSupplierId);
CREATE INDEX NmsSupplierModel_workflowId ON NmsSupplierModel(iWorkflowId);
CREATE INDEX NmsSupplierModel_groupId ON NmsSupplierModel(iGroupId);
CREATE INDEX NmsSupplierModel_deliveryMode ON NmsSupplierModel(iDeliveryModelId);
  
INSERT INTO NmsSupplierModel (iSupplierModelId) VALUES (0); 

-- Log: Creating table 'NmsTask'


CREATE TABLE NmsTask(
  dComputedCost DOUBLE PRECISION NOT NULL Default 0, 
  dDuration DOUBLE PRECISION, 
  dEstimatedCost DOUBLE PRECISION NOT NULL Default 0, 
  dExecutionDelay DOUBLE PRECISION, 
  dPlannedDuration DOUBLE PRECISION, 
  dRealCost DOUBLE PRECISION NOT NULL Default 0, 
  dRealizedDuration DOUBLE PRECISION, 
  dStartDelay DOUBLE PRECISION, 
  dUnitaryCost DOUBLE PRECISION NOT NULL Default 0, 
  iAssetId INTEGER NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCommitmentLevel SMALLINT NOT NULL Default 0, 
  iComputationState SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iDependingTaskId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iLinkedTaskId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOwnerId INTEGER NOT NULL Default 0, 
  iPriority SMALLINT NOT NULL Default 0, 
  iProgress INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iSupplierModelId INTEGER NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iUseTaskValidation SMALLINT NOT NULL Default 0, 
  iValidationState SMALLINT NOT NULL Default 0, 
  iValidationType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sExternalId VARCHAR(255), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sNature VARCHAR(64), 
  tsCompleted TIMESTAMPTZ, 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsExecution TIMESTAMPTZ, 
  tsExpectedValidation DATE, 
  tsLastComputed TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsReminder DATE, 
  tsStart TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsTask_id ON NmsTask(iTaskId);
CREATE UNIQUE INDEX NmsTask_name ON NmsTask(sName);
CREATE INDEX NmsTask_folderId ON NmsTask(iFolderId);
CREATE INDEX NmsTask_assetId ON NmsTask(iAssetId);
CREATE INDEX NmsTask_deliveryId ON NmsTask(iDeliveryId);
CREATE INDEX NmsTask_linkedTaskId ON NmsTask(iLinkedTaskId);
CREATE INDEX NmsTask_dependingTaskId ON NmsTask(iDependingTaskId);
CREATE INDEX NmsTask_supplierModelId ON NmsTask(iSupplierModelId);
CREATE INDEX NmsTask_operationId ON NmsTask(iOperationId);
CREATE INDEX NmsTask_budgetId ON NmsTask(iBudgetId);
CREATE INDEX NmsTask_ownerId ON NmsTask(iOwnerId);
CREATE INDEX NmsTask_modifiedById ON NmsTask(iModifiedById);
CREATE INDEX NmsTask_createdById ON NmsTask(iCreatedById);
  
INSERT INTO NmsTask (iTaskId) VALUES (0); 

-- Log: Creating table 'NmsTaskOpRel'


CREATE TABLE NmsTaskOpRel(
  dPlannedDuration DOUBLE PRECISION, 
  dRealizedDuration DOUBLE PRECISION, 
  iOccupationRate SMALLINT NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  iValidationState SMALLINT NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsTaskOpRel_id ON NmsTaskOpRel(iTaskId, iOperatorId);
CREATE INDEX NmsTaskOpRel_operatorId ON NmsTaskOpRel(iOperatorId);
  
-- Log: Creating table 'NmsTrackingLogBatchEvent'


CREATE TABLE NmsTrackingLogBatchEvent(
  iBatchEventId INTEGER NOT NULL Default 0, 
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iTrackingLogId INTEGER NOT NULL Default 0, 
  iUrlId INTEGER NOT NULL Default 0, 
  iUserAgent INTEGER NOT NULL Default 0, 
  sExternalId VARCHAR(48), 
  sSourceId VARCHAR(48), 
  sSourceType VARCHAR(16), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX NmsTrackingLogBatchEvent_urlId ON NmsTrackingLogBatchEvent(iUrlId, iBatchEventId);
CREATE INDEX TrackingLogBatchEvent_delivery ON NmsTrackingLogBatchEvent(iDeliveryId, tsLog);
CREATE INDEX sTrackingLogBatchEvent_logDate ON NmsTrackingLogBatchEvent(tsLog);
CREATE UNIQUE INDEX NmsTrackingLogBatchEvent_id ON NmsTrackingLogBatchEvent(iTrackingLogId);
CREATE INDEX NmsTrackingLogBatchEvent_batc ON NmsTrackingLogBatchEvent(iBatchEventId);
CREATE INDEX NmsTrackingLogBatchEvent_broa ON NmsTrackingLogBatchEvent(iBroadLogId);
  
INSERT INTO NmsTrackingLogBatchEvent (iTrackingLogId) VALUES (0); 

-- Log: Creating table 'NmsTrackingLogEventHisto'


CREATE TABLE NmsTrackingLogEventHisto(
  biBroadLogId BIGINT NOT NULL Default 0, 
  biEventId BIGINT NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iTrackingLogId BIGINT NOT NULL Default 0, 
  iUrlId INTEGER NOT NULL Default 0, 
  iUserAgent INTEGER NOT NULL Default 0, 
  sExternalId VARCHAR(48), 
  sSourceId VARCHAR(48), 
  sSourceType VARCHAR(16), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX NmsTrackingLogEventHisto_urlId ON NmsTrackingLogEventHisto(iUrlId, biEventId);
CREATE INDEX TrackingLogEventHisto_delivery ON NmsTrackingLogEventHisto(iDeliveryId, tsLog);
CREATE INDEX sTrackingLogEventHisto_logDate ON NmsTrackingLogEventHisto(tsLog);
CREATE UNIQUE INDEX NmsTrackingLogEventHisto_id ON NmsTrackingLogEventHisto(iTrackingLogId);
CREATE INDEX NmsTrackingLogEventHisto_even ON NmsTrackingLogEventHisto(biEventId);
CREATE INDEX NmsTrackingLogEventHisto_broa ON NmsTrackingLogEventHisto(biBroadLogId);
  
-- Log: Creating table 'NmsTrackingLogRcp'


CREATE TABLE NmsTrackingLogRcp(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iTrackingLogId INTEGER NOT NULL Default 0, 
  iUrlId INTEGER NOT NULL Default 0, 
  iUserAgent INTEGER NOT NULL Default 0, 
  sExternalId VARCHAR(48), 
  sSourceId VARCHAR(48), 
  sSourceType VARCHAR(16), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX NmsTrackingLogRcp_sourceId ON NmsTrackingLogRcp(sSourceId);
CREATE INDEX NmsTrackingLogRcp_urlId ON NmsTrackingLogRcp(iUrlId, iRecipientId);
CREATE INDEX NmsTrackingLogRcp_delivery ON NmsTrackingLogRcp(iDeliveryId, tsLog);
CREATE INDEX NmsTrackingLogRcp_logDate ON NmsTrackingLogRcp(tsLog);
CREATE UNIQUE INDEX NmsTrackingLogRcp_id ON NmsTrackingLogRcp(iTrackingLogId);
CREATE INDEX NmsTrackingLogRcp_recipientId ON NmsTrackingLogRcp(iRecipientId);
CREATE INDEX NmsTrackingLogRcp_broadLogId ON NmsTrackingLogRcp(iBroadLogId);
  
INSERT INTO NmsTrackingLogRcp (iTrackingLogId) VALUES (0); 

-- Log: Creating table 'NmsTrackingLogRtEvent'


CREATE TABLE NmsTrackingLogRtEvent(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iRtEventId INTEGER NOT NULL Default 0, 
  iTrackingLogId INTEGER NOT NULL Default 0, 
  iUrlId INTEGER NOT NULL Default 0, 
  iUserAgent INTEGER NOT NULL Default 0, 
  sExternalId VARCHAR(48), 
  sSourceId VARCHAR(48), 
  sSourceType VARCHAR(16), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX NmsTrackingLogRtEvent_urlId ON NmsTrackingLogRtEvent(iUrlId, iRtEventId);
CREATE INDEX NmsTrackingLogRtEvent_delivery ON NmsTrackingLogRtEvent(iDeliveryId, tsLog);
CREATE INDEX NmsTrackingLogRtEvent_logDate ON NmsTrackingLogRtEvent(tsLog);
CREATE UNIQUE INDEX NmsTrackingLogRtEvent_id ON NmsTrackingLogRtEvent(iTrackingLogId);
CREATE INDEX NmsTrackingLogRtEvent_rtEvent ON NmsTrackingLogRtEvent(iRtEventId);
CREATE INDEX NmsTrackingLogRtEvent_broadLo ON NmsTrackingLogRtEvent(iBroadLogId);
  
INSERT INTO NmsTrackingLogRtEvent (iTrackingLogId) VALUES (0); 

-- Log: Creating table 'NmsTrackingLogSvc'


CREATE TABLE NmsTrackingLogSvc(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iTrackingLogId INTEGER NOT NULL Default 0, 
  iUrlId INTEGER NOT NULL Default 0, 
  iUserAgent INTEGER NOT NULL Default 0, 
  sExternalId VARCHAR(48), 
  sSourceId VARCHAR(48), 
  sSourceType VARCHAR(16), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX NmsTrackingLogSvc_urlId ON NmsTrackingLogSvc(iUrlId, iServiceId);
CREATE INDEX NmsTrackingLogSvc_delivery ON NmsTrackingLogSvc(iDeliveryId, tsLog);
CREATE INDEX NmsTrackingLogSvc_logDate ON NmsTrackingLogSvc(tsLog);
CREATE UNIQUE INDEX NmsTrackingLogSvc_id ON NmsTrackingLogSvc(iTrackingLogId);
CREATE INDEX NmsTrackingLogSvc_serviceId ON NmsTrackingLogSvc(iServiceId);
CREATE INDEX NmsTrackingLogSvc_broadLogId ON NmsTrackingLogSvc(iBroadLogId);
  
INSERT INTO NmsTrackingLogSvc (iTrackingLogId) VALUES (0); 

-- Log: Creating table 'NmsTrackingLogVisitor'


CREATE TABLE NmsTrackingLogVisitor(
  iBroadLogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iTrackingLogId INTEGER NOT NULL Default 0, 
  iUrlId INTEGER NOT NULL Default 0, 
  iUserAgent INTEGER NOT NULL Default 0, 
  iVisitorId INTEGER NOT NULL Default 0, 
  sExternalId VARCHAR(48), 
  sSourceId VARCHAR(48), 
  sSourceType VARCHAR(16), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX NmsTrackingLogVisitor_urlId ON NmsTrackingLogVisitor(iUrlId, iVisitorId);
CREATE INDEX NmsTrackingLogVisitor_delivery ON NmsTrackingLogVisitor(iDeliveryId, tsLog);
CREATE INDEX NmsTrackingLogVisitor_logDate ON NmsTrackingLogVisitor(tsLog);
CREATE UNIQUE INDEX NmsTrackingLogVisitor_id ON NmsTrackingLogVisitor(iTrackingLogId);
CREATE INDEX NmsTrackingLogVisitor_visitor ON NmsTrackingLogVisitor(iVisitorId);
CREATE INDEX NmsTrackingLogVisitor_broadLo ON NmsTrackingLogVisitor(iBroadLogId);
  
INSERT INTO NmsTrackingLogVisitor (iTrackingLogId) VALUES (0); 

-- Log: Creating table 'NmsTrackingStats'


CREATE TABLE NmsTrackingStats(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iArticle INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iTotalClicks INTEGER NOT NULL Default 0, 
  iTrackingStatsId INTEGER NOT NULL Default 0, 
  iTransaction INTEGER NOT NULL Default 0, 
  iUrlId INTEGER NOT NULL Default 0, 
  sSourceType VARCHAR(16), 
  tsEnd TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE INDEX NmsTrackingStats_deliveryId ON NmsTrackingStats(iDeliveryId, tsStart);
CREATE UNIQUE INDEX NmsTrackingStats_id ON NmsTrackingStats(iTrackingStatsId);
CREATE INDEX NmsTrackingStats_urlId ON NmsTrackingStats(iUrlId);
  
INSERT INTO NmsTrackingStats (iTrackingStatsId) VALUES (0); 

-- Log: Creating table 'NmsTrackingUrl'


CREATE TABLE NmsTrackingUrl(
  iChecksum INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iOccurrence SMALLINT NOT NULL Default 0, 
  iPurlId INTEGER NOT NULL Default 0, 
  iStep SMALLINT NOT NULL Default 0, 
  iTrackingUrlId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iWithParams SMALLINT NOT NULL Default 0, 
  sCategory VARCHAR(100), 
  sGoal VARCHAR(64), 
  sLabel VARCHAR(255), 
  sSource VARCHAR(1000), 
  sTagId VARCHAR(128), 
  sTrackerName VARCHAR(32), 
  tsValidity DATE
);

CREATE INDEX NmsTrackingUrl_code ON NmsTrackingUrl(iChecksum);
CREATE UNIQUE INDEX NmsTrackingUrl_id ON NmsTrackingUrl(iTrackingUrlId);
CREATE UNIQUE INDEX NmsTrackingUrl_tagId ON NmsTrackingUrl(sTagId);
CREATE INDEX NmsTrackingUrl_purlId ON NmsTrackingUrl(iPurlId);
CREATE INDEX NmsTrackingUrl_folderId ON NmsTrackingUrl(iFolderId);
CREATE INDEX NmsTrackingUrl_deliveryId ON NmsTrackingUrl(iDeliveryId);
  
INSERT INTO NmsTrackingUrl (iTrackingUrlId) VALUES (0); 

-- Log: Creating table 'NmsTrackingUrlInfo'


CREATE TABLE NmsTrackingUrlInfo(
  iActive SMALLINT NOT NULL Default 0, 
  iChecksum INTEGER NOT NULL Default 0, 
  iTrackingUrlInfoId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  sCategory VARCHAR(100), 
  sLabel VARCHAR(255), 
  sSource VARCHAR(1000)
);

CREATE INDEX NmsTrackingUrlInfo_code ON NmsTrackingUrlInfo(iChecksum);
CREATE UNIQUE INDEX NmsTrackingUrlInfo_id ON NmsTrackingUrlInfo(iTrackingUrlInfoId);
  
INSERT INTO NmsTrackingUrlInfo (iTrackingUrlInfoId) VALUES (0); 

-- Log: Creating table 'NmsTypology'


CREATE TABLE NmsTypology(
  iCentralTypologyId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iLocalOrgUnitId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iTypologyId INTEGER NOT NULL Default 0, 
  sDesc VARCHAR(512), 
  sIPAffinity VARCHAR(64), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsTypology_id ON NmsTypology(iTypologyId);
CREATE UNIQUE INDEX NmsTypology_name ON NmsTypology(sName);
CREATE INDEX NmsTypology_centralTypologyId ON NmsTypology(iCentralTypologyId);
CREATE INDEX NmsTypology_localOrgUnitId ON NmsTypology(iLocalOrgUnitId);
CREATE INDEX NmsTypology_folderId ON NmsTypology(iFolderId);
CREATE INDEX NmsTypology_modifiedById ON NmsTypology(iModifiedById);
CREATE INDEX NmsTypology_createdById ON NmsTypology(iCreatedById);
  
INSERT INTO NmsTypology (iTypologyId) VALUES (0); 

-- Log: Creating table 'NmsTypologyRule'


CREATE TABLE NmsTypologyRule(
  dValidity DOUBLE PRECISION, 
  iActive SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCentralTypologyRuleId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iForceOnPrepareMessage SMALLINT NOT NULL Default 0, 
  iLocalOrgUnitId INTEGER NOT NULL Default 0, 
  iMessageType SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOrder INTEGER NOT NULL Default 0, 
  iTypologyRuleId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sDesc VARCHAR(512), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sRuleStep VARCHAR(16), 
  sRuleType VARCHAR(30), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX NmsTypologyRule_mt ON NmsTypologyRule(iMessageType);
CREATE UNIQUE INDEX NmsTypologyRule_id ON NmsTypologyRule(iTypologyRuleId);
CREATE UNIQUE INDEX NmsTypologyRule_name ON NmsTypologyRule(sName);
CREATE INDEX NmsTypologyRule_centralTypolo ON NmsTypologyRule(iCentralTypologyRuleId);
CREATE INDEX NmsTypologyRule_localOrgUnitI ON NmsTypologyRule(iLocalOrgUnitId);
CREATE INDEX NmsTypologyRule_folderId ON NmsTypologyRule(iFolderId);
CREATE INDEX NmsTypologyRule_modifiedById ON NmsTypologyRule(iModifiedById);
CREATE INDEX NmsTypologyRule_createdById ON NmsTypologyRule(iCreatedById);
  
INSERT INTO NmsTypologyRule (iTypologyRuleId) VALUES (0); 

-- Log: Creating table 'NmsTypologyRuleRel'


CREATE TABLE NmsTypologyRuleRel(
  iRuleId INTEGER NOT NULL Default 0, 
  iTypologyId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsTypologyRuleRel_id ON NmsTypologyRuleRel(iTypologyId, iRuleId);
CREATE INDEX NmsTypologyRuleRel_ruleId ON NmsTypologyRuleRel(iRuleId);
  
-- Log: Creating table 'NmsUserAgent'


CREATE TABLE NmsUserAgent(
  iHashKey INTEGER NOT NULL Default 0, 
  sBrowserImage VARCHAR(15), 
  sBrowserName VARCHAR(50), 
  sBrowserVersion VARCHAR(10), 
  sOSFamilly VARCHAR(20), 
  sOSImage VARCHAR(15), 
  sOSName VARCHAR(50)
);

CREATE UNIQUE INDEX NmsUserAgent_hashKey ON NmsUserAgent(iHashKey);
  
-- Log: Creating table 'NmsUserAgentReject'


CREATE TABLE NmsUserAgentReject(
  iHashKey INTEGER NOT NULL Default 0, 
  iHit INTEGER NOT NULL Default 0, 
  sBrowserImage VARCHAR(15), 
  sBrowserName VARCHAR(50), 
  sBrowserVersion VARCHAR(10), 
  sOSFamilly VARCHAR(20), 
  sOSImage VARCHAR(15), 
  sOSName VARCHAR(50), 
  sUserAgentString VARCHAR(255), 
  tsLastUpdate TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsUserAgentReject_hashKey ON NmsUserAgentReject(iHashKey);
  
-- Log: Creating table 'NmsUserAgentStats'


CREATE TABLE NmsUserAgentStats(
  iHashKey INTEGER NOT NULL Default 0, 
  iPages INTEGER NOT NULL Default 0, 
  iVisitors INTEGER NOT NULL Default 0, 
  iVisitorsOfTheDay INTEGER NOT NULL Default 0, 
  tsDate DATE
);

CREATE UNIQUE INDEX NmsUserAgentStats_hashKey ON NmsUserAgentStats(iHashKey, tsDate);
  
-- Log: Creating table 'NmsValidationLog'


CREATE TABLE NmsValidationLog(
  iAction SMALLINT NOT NULL Default 0, 
  iAssetId INTEGER NOT NULL Default 0, 
  iCentralCatalogId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iLocalOrderId INTEGER NOT NULL Default 0, 
  iOfferId INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  iValidatedById INTEGER NOT NULL Default 0, 
  iValidationLogId INTEGER NOT NULL Default 0, 
  mComment TEXT, 
  tsDate TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsValidationLog_id ON NmsValidationLog(iValidationLogId);
CREATE INDEX NmsValidationLog_offerId ON NmsValidationLog(iOfferId);
CREATE INDEX NmsValidationLog_localOrderId ON NmsValidationLog(iLocalOrderId);
CREATE INDEX NmsValidationLog_centralCatal ON NmsValidationLog(iCentralCatalogId);
CREATE INDEX NmsValidationLog_taskId ON NmsValidationLog(iTaskId);
CREATE INDEX NmsValidationLog_assetId ON NmsValidationLog(iAssetId);
CREATE INDEX NmsValidationLog_deliveryId ON NmsValidationLog(iDeliveryId);
CREATE INDEX NmsValidationLog_operationId ON NmsValidationLog(iOperationId);
CREATE INDEX NmsValidationLog_validatedByI ON NmsValidationLog(iValidatedById);
  
INSERT INTO NmsValidationLog (iValidationLogId) VALUES (0); 

-- Log: Creating table 'NmsVisitor'


CREATE TABLE NmsVisitor(
  iDeliveryId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFriendCount INTEGER NOT NULL Default 0, 
  iGender SMALLINT NOT NULL Default 0, 
  iIncomingLeadId INTEGER NOT NULL Default 0, 
  iOrigin SMALLINT NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iReferrerId INTEGER NOT NULL Default 0, 
  iVerified SMALLINT NOT NULL Default 0, 
  iVisitorId INTEGER NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  sAccessToken VARCHAR(128), 
  sComment VARCHAR(255), 
  sEmail VARCHAR(128), 
  sExternalId VARCHAR(64), 
  sFirstName VARCHAR(30), 
  sForwardUrl VARCHAR(255), 
  sLang VARCHAR(12), 
  sLastName VARCHAR(50), 
  sLocation VARCHAR(128), 
  sName VARCHAR(128), 
  sPicture VARCHAR(128), 
  sReferrerEmail VARCHAR(128), 
  sReferrerFirstName VARCHAR(30), 
  sReferrerLastName VARCHAR(50), 
  sScreenName VARCHAR(32), 
  sTimezone VARCHAR(64), 
  tsBirth DATE, 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsTokenExpiration TIMESTAMPTZ
);

CREATE INDEX NmsVisitor_lastModified ON NmsVisitor(iFolderId, tsLastModified);
CREATE INDEX NmsVisitor_created ON NmsVisitor(iFolderId, tsCreated);
CREATE INDEX NmsVisitor_email ON NmsVisitor(iFolderId, sEmail);
CREATE INDEX NmsVisitor_lastName ON NmsVisitor(iFolderId, sLastName);
CREATE UNIQUE INDEX NmsVisitor_id ON NmsVisitor(iVisitorId);
CREATE UNIQUE INDEX NmsVisitor_externalId ON NmsVisitor(sExternalId, iOrigin);
CREATE INDEX NmsVisitor_webAppId ON NmsVisitor(iWebAppId);
  
INSERT INTO NmsVisitor (iVisitorId) VALUES (0); 

-- Log: Creating table 'NmsVisitorInterestRel'


CREATE TABLE NmsVisitorInterestRel(
  iInterestId INTEGER NOT NULL Default 0, 
  iVisitorId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX NmsVisitorInterestRel_id ON NmsVisitorInterestRel(iInterestId, iVisitorId);
CREATE INDEX NmsVisitorInterestRel_visitor ON NmsVisitorInterestRel(iVisitorId);
  
-- Log: Creating table 'NmsVisitorSub'


CREATE TABLE NmsVisitorSub(
  iServiceId INTEGER NOT NULL Default 0, 
  iVisitorId INTEGER NOT NULL Default 0, 
  tsCreated TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsVisitorSub_visitorSubKey ON NmsVisitorSub(iVisitorId, iServiceId);
CREATE INDEX NmsVisitorSub_serviceId ON NmsVisitorSub(iServiceId);
  
-- Log: Creating table 'NmsVolumeConsumed'


CREATE TABLE NmsVolumeConsumed(
  dConsumed DOUBLE PRECISION NOT NULL Default 0, 
  iContextId INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iTypologyRuleId INTEGER NOT NULL Default 0, 
  iVolumeConsumedId INTEGER NOT NULL Default 0, 
  iVolumeLineId INTEGER NOT NULL Default 0, 
  tsDate TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsVolumeConsumed_id ON NmsVolumeConsumed(iVolumeConsumedId);
CREATE INDEX NmsVolumeConsumed_typologyRul ON NmsVolumeConsumed(iTypologyRuleId);
CREATE INDEX NmsVolumeConsumed_volumeLineI ON NmsVolumeConsumed(iVolumeLineId);
CREATE INDEX NmsVolumeConsumed_deliveryId ON NmsVolumeConsumed(iDeliveryId);
  
INSERT INTO NmsVolumeConsumed (iVolumeConsumedId) VALUES (0); 

-- Log: Creating table 'NmsVolumeLine'


CREATE TABLE NmsVolumeLine(
  dConsumed DOUBLE PRECISION NOT NULL Default 0, 
  dInitial DOUBLE PRECISION NOT NULL Default 0, 
  iTypologyRuleId INTEGER NOT NULL Default 0, 
  iVolumeLineId INTEGER NOT NULL Default 0, 
  sSubChannel VARCHAR(32), 
  tsEnd TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsVolumeLine_id ON NmsVolumeLine(iVolumeLineId);
CREATE INDEX NmsVolumeLine_typologyRuleId ON NmsVolumeLine(iTypologyRuleId);
  
INSERT INTO NmsVolumeLine (iVolumeLineId) VALUES (0); 

-- Log: Creating table 'NmsWebApp'


CREATE TABLE NmsWebApp(
  iAdvanced SMALLINT NOT NULL Default 0, 
  iAppState SMALLINT NOT NULL Default 0, 
  iAppType SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDefaultDictionaryId INTEGER NOT NULL Default 0, 
  iDefaultOriginId INTEGER NOT NULL Default 0, 
  iDeliveryMappingId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iIdCounter INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iLead SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  iPurl SMALLINT NOT NULL Default 0, 
  iRenderingId INTEGER NOT NULL Default 0, 
  iSocial SMALLINT NOT NULL Default 0, 
  iState SMALLINT NOT NULL Default 0, 
  iSurvey SMALLINT NOT NULL Default 0, 
  iTranslationStatus SMALLINT NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sDefaultLanguage VARCHAR(255), 
  sDesc VARCHAR(512), 
  sDesignLanguage VARCHAR(255), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLibrary VARCHAR(255), 
  sNature VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsPublication TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsWebApp_id ON NmsWebApp(iWebAppId);
CREATE UNIQUE INDEX NmsWebApp_name ON NmsWebApp(sInternalName);
CREATE INDEX NmsWebApp_folderProcessId ON NmsWebApp(iFolderProcessId);
CREATE INDEX NmsWebApp_deliveryMappingId ON NmsWebApp(iDeliveryMappingId);
CREATE INDEX NmsWebApp_defaultOriginId ON NmsWebApp(iDefaultOriginId);
CREATE INDEX NmsWebApp_operationId ON NmsWebApp(iOperationId);
CREATE INDEX NmsWebApp_renderingId ON NmsWebApp(iRenderingId);
CREATE INDEX NmsWebApp_folderId ON NmsWebApp(iFolderId);
CREATE INDEX NmsWebApp_operatorId ON NmsWebApp(iOperatorId);
CREATE INDEX NmsWebApp_defaultDictionaryId ON NmsWebApp(iDefaultDictionaryId);
CREATE INDEX NmsWebApp_modifiedById ON NmsWebApp(iModifiedById);
CREATE INDEX NmsWebApp_createdById ON NmsWebApp(iCreatedById);
  
INSERT INTO NmsWebApp (iWebAppId) VALUES (0); 

-- Log: Creating table 'NmsWebAppLogRcp'


CREATE TABLE NmsWebAppLogRcp(
  dScore DOUBLE PRECISION NOT NULL Default 0, 
  iCreation SMALLINT NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iRecipientId INTEGER NOT NULL Default 0, 
  iWebAppId INTEGER NOT NULL Default 0, 
  iWebAppLogRcpId INTEGER NOT NULL Default 0, 
  sLanguage VARCHAR(2), 
  sOrigin VARCHAR(80), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX NmsWebAppLogRcp_date ON NmsWebAppLogRcp(iWebAppId, tsLog);
CREATE UNIQUE INDEX NmsWebAppLogRcp_id ON NmsWebAppLogRcp(iWebAppLogRcpId);
CREATE INDEX NmsWebAppLogRcp_deliveryId ON NmsWebAppLogRcp(iDeliveryId);
CREATE INDEX NmsWebAppLogRcp_recipientId ON NmsWebAppLogRcp(iRecipientId);
  
INSERT INTO NmsWebAppLogRcp (iWebAppLogRcpId) VALUES (0); 

-- Log: Creating table 'NmsWebEvent'


CREATE TABLE NmsWebEvent(
  iBroadLogRemktId INTEGER NOT NULL Default 0, 
  iBroadLogSrcId INTEGER NOT NULL Default 0, 
  iConverted SMALLINT NOT NULL Default 0, 
  iSegmentId INTEGER NOT NULL Default 0, 
  iWebEventId INTEGER NOT NULL Default 0, 
  sDeliveryInternalName VARCHAR(255), 
  sProductCode VARCHAR(255), 
  tsEvent DATE
);

CREATE UNIQUE INDEX NmsWebEvent_id ON NmsWebEvent(iWebEventId);
CREATE INDEX NmsWebEvent_segmentId ON NmsWebEvent(iSegmentId);
  
INSERT INTO NmsWebEvent (iWebEventId) VALUES (0); 

-- Log: Creating table 'NmsWebForm'


CREATE TABLE NmsWebForm(
  iCreatedById INTEGER NOT NULL Default 0, 
  iCreationFolderId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iSearchFolderId INTEGER NOT NULL Default 0, 
  iServiceId INTEGER NOT NULL Default 0, 
  iWebFormId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sXsltMailName VARCHAR(80), 
  sXsltMailNamespace VARCHAR(16), 
  sXsltWebName VARCHAR(80), 
  sXsltWebNamespace VARCHAR(16), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsWebForm_id ON NmsWebForm(iWebFormId);
CREATE UNIQUE INDEX NmsWebForm_name ON NmsWebForm(sName);
CREATE INDEX NmsWebForm_folderId ON NmsWebForm(iFolderId);
CREATE INDEX NmsWebForm_xsltWebNamespace ON NmsWebForm(sXsltWebNamespace, sXsltWebName);
CREATE INDEX NmsWebForm_xsltMailNamespace ON NmsWebForm(sXsltMailNamespace, sXsltMailName);
CREATE INDEX NmsWebForm_creationFolderId ON NmsWebForm(iCreationFolderId);
CREATE INDEX NmsWebForm_searchFolderId ON NmsWebForm(iSearchFolderId);
CREATE INDEX NmsWebForm_serviceId ON NmsWebForm(iServiceId);
CREATE INDEX NmsWebForm_modifiedById ON NmsWebForm(iModifiedById);
CREATE INDEX NmsWebForm_createdById ON NmsWebForm(iCreatedById);
  
INSERT INTO NmsWebForm (iWebFormId) VALUES (0); 

-- Log: Creating table 'NmsWebOfferView'


CREATE TABLE NmsWebOfferView(
  iOfferId INTEGER NOT NULL Default 0, 
  iSpaceId INTEGER NOT NULL Default 0, 
  iWebOfferViewId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  tsPublication TIMESTAMPTZ
);

CREATE UNIQUE INDEX NmsWebOfferView_id ON NmsWebOfferView(iWebOfferViewId);
CREATE UNIQUE INDEX NmsWebOfferView_type ON NmsWebOfferView(iOfferId, iSpaceId);
CREATE INDEX NmsWebOfferView_spaceId ON NmsWebOfferView(iSpaceId);
  
INSERT INTO NmsWebOfferView (iWebOfferViewId) VALUES (0); 

-- Log: Creating table 'NmsWebTrackingLog'


CREATE TABLE NmsWebTrackingLog(
  dAmount DOUBLE PRECISION NOT NULL Default 0, 
  iArticle INTEGER NOT NULL Default 0, 
  iDeliveryId INTEGER NOT NULL Default 0, 
  iVisitorId INTEGER NOT NULL Default 0, 
  iWebTrackingLogId INTEGER NOT NULL Default 0, 
  sCategory VARCHAR(10)
);

CREATE UNIQUE INDEX NmsWebTrackingLog_id ON NmsWebTrackingLog(iWebTrackingLogId);
  
-- Log: Creating table 'XtkConflict'


CREATE TABLE XtkConflict(
  iCreatedById INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sEntitySchema VARCHAR(80), 
  sImg VARCHAR(80), 
  sName VARCHAR(80), 
  sNamespace VARCHAR(16), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkConflict_name ON XtkConflict(sEntitySchema, sNamespace, sName);
CREATE INDEX XtkConflict_modifiedById ON XtkConflict(iModifiedById);
CREATE INDEX XtkConflict_createdById ON XtkConflict(iCreatedById);
  
-- Log: Creating table 'XtkCounter'


CREATE TABLE XtkCounter(
  iCounterId INTEGER NOT NULL Default 0, 
  iValue INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sLabel VARCHAR(80), 
  sName VARCHAR(64)
);

CREATE UNIQUE INDEX XtkCounter_id ON XtkCounter(iCounterId);
CREATE UNIQUE INDEX XtkCounter_name ON XtkCounter(sName);
  
INSERT INTO XtkCounter (iCounterId) VALUES (0); 

-- Log: Creating table 'XtkDashboard'


CREATE TABLE XtkDashboard(
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDashboardId INTEGER NOT NULL Default 0, 
  iDefault SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sDesc VARCHAR(512), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkDashboard_id ON XtkDashboard(iDashboardId);
CREATE UNIQUE INDEX XtkDashboard_name ON XtkDashboard(sName);
CREATE INDEX XtkDashboard_folderId ON XtkDashboard(iFolderId);
CREATE INDEX XtkDashboard_modifiedById ON XtkDashboard(iModifiedById);
CREATE INDEX XtkDashboard_createdById ON XtkDashboard(iCreatedById);
  
INSERT INTO XtkDashboard (iDashboardId) VALUES (0); 

-- Log: Creating table 'XtkDictionaryString'


CREATE TABLE XtkDictionaryString(
  iCreatedById INTEGER NOT NULL Default 0, 
  iDictionaryStringId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iObjectId INTEGER NOT NULL Default 0, 
  iSourceStringId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  sContext VARCHAR(32), 
  sLocale VARCHAR(12), 
  sSourceId VARCHAR(255), 
  sText VARCHAR(2000), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkDictionaryString_id ON XtkDictionaryString(iDictionaryStringId);
CREATE UNIQUE INDEX XtkDictionaryString_name ON XtkDictionaryString(sSourceId, sLocale, iObjectId);
CREATE INDEX XtkDictionaryString_folderId ON XtkDictionaryString(iFolderId);
CREATE INDEX XtkDictionaryString_modifiedB ON XtkDictionaryString(iModifiedById);
CREATE INDEX XtkDictionaryString_createdBy ON XtkDictionaryString(iCreatedById);
CREATE INDEX XtkDictionaryString_sourceStr ON XtkDictionaryString(iSourceStringId);
  
INSERT INTO XtkDictionaryString (iDictionaryStringId) VALUES (0); 

-- Log: Creating table 'XtkEntity'


CREATE TABLE XtkEntity(
  iCreatedById INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sEntitySchema VARCHAR(80), 
  sImg VARCHAR(80), 
  sLabel VARCHAR(128), 
  sMd5 VARCHAR(32), 
  sName VARCHAR(80), 
  sNamespace VARCHAR(16), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkEntity_name ON XtkEntity(sEntitySchema, sNamespace, sName);
CREATE INDEX XtkEntity_modifiedById ON XtkEntity(iModifiedById);
CREATE INDEX XtkEntity_createdById ON XtkEntity(iCreatedById);
  
-- Log: Creating table 'XtkEnum'


CREATE TABLE XtkEnum(
  iAliases SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iEnumId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  sLabel VARCHAR(128), 
  sName VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsLastAliasCleansing TIMESTAMPTZ, 
  tsLastHitsComputation TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkEnum_id ON XtkEnum(iEnumId);
CREATE UNIQUE INDEX XtkEnum_enum ON XtkEnum(sName);
CREATE INDEX XtkEnum_modifiedById ON XtkEnum(iModifiedById);
CREATE INDEX XtkEnum_createdById ON XtkEnum(iCreatedById);
  
INSERT INTO XtkEnum (iEnumId) VALUES (0); 

-- Log: Creating table 'XtkEnumAlias'


CREATE TABLE XtkEnumAlias(
  iEnumAliasId INTEGER NOT NULL Default 0, 
  iEnumId INTEGER NOT NULL Default 0, 
  iEnumValueId INTEGER NOT NULL Default 0, 
  iHits INTEGER NOT NULL Default 0, 
  sLabel VARCHAR(255), 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX XtkEnumAlias_label ON XtkEnumAlias(iEnumId, sLabel);
CREATE UNIQUE INDEX XtkEnumAlias_id ON XtkEnumAlias(iEnumAliasId);
CREATE INDEX XtkEnumAlias_enumValueId ON XtkEnumAlias(iEnumValueId);
  
INSERT INTO XtkEnumAlias (iEnumAliasId) VALUES (0); 

-- Log: Creating table 'XtkEnumValue'


CREATE TABLE XtkEnumValue(
  iEnumId INTEGER NOT NULL Default 0, 
  iValueId INTEGER NOT NULL Default 0, 
  sImg VARCHAR(128), 
  sLabel VARCHAR(255), 
  sName VARCHAR(64), 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX XtkEnumValue_label ON XtkEnumValue(iEnumId, sLabel);
CREATE UNIQUE INDEX XtkEnumValue_id ON XtkEnumValue(iValueId);
  
INSERT INTO XtkEnumValue (iValueId) VALUES (0); 

-- Log: Creating table 'XtkFileRes'


CREATE TABLE XtkFileRes(
  iCodepage INTEGER NOT NULL Default 0, 
  iContainerId INTEGER NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFileResId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iHeight INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iPublish SMALLINT NOT NULL Default 0, 
  iStorageType SMALLINT NOT NULL Default 0, 
  iUseMd5AsFilename SMALLINT NOT NULL Default 0, 
  iWidth INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sAlt VARCHAR(64), 
  sContentType VARCHAR(100), 
  sFileName VARCHAR(255), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sMd5 VARCHAR(32), 
  sNature VARCHAR(64), 
  sOriginalName VARCHAR(255), 
  sOriginalServer VARCHAR(255), 
  sVersion VARCHAR(20), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX XtkFileRes_lastModified ON XtkFileRes(iFolderId, tsLastModified);
CREATE UNIQUE INDEX XtkFileRes_id ON XtkFileRes(iFileResId);
CREATE UNIQUE INDEX XtkFileRes_name ON XtkFileRes(sInternalName);
CREATE INDEX XtkFileRes_modifiedById ON XtkFileRes(iModifiedById);
CREATE INDEX XtkFileRes_createdById ON XtkFileRes(iCreatedById);
CREATE INDEX XtkFileRes_containerId ON XtkFileRes(iContainerId);
  
INSERT INTO XtkFileRes (iFileResId) VALUES (0); 

-- Log: Creating table 'XtkFileResData'


CREATE TABLE XtkFileResData(
  bContent BYTEA, 
  iSize INTEGER NOT NULL Default 0, 
  sMd5 VARCHAR(32)
);

CREATE UNIQUE INDEX XtkFileResData_md5 ON XtkFileResData(sMd5);
  
-- Log: Creating table 'XtkFileResHistory'


CREATE TABLE XtkFileResHistory(
  iActivityType SMALLINT NOT NULL Default 0, 
  iFileResHistoryId INTEGER NOT NULL Default 0, 
  iFileResId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  sDescription VARCHAR(255), 
  sMd5 VARCHAR(32), 
  sVersion VARCHAR(20), 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX XtkFileResHistory_logDate ON XtkFileResHistory(iFileResId, tsLastModified);
CREATE UNIQUE INDEX XtkFileResHistory_id ON XtkFileResHistory(iFileResHistoryId);
CREATE INDEX XtkFileResHistory_modifiedByI ON XtkFileResHistory(iModifiedById);
  
INSERT INTO XtkFileResHistory (iFileResHistoryId) VALUES (0); 

-- Log: Creating table 'XtkFolder'


CREATE TABLE XtkFolder(
  dComputedCost DOUBLE PRECISION NOT NULL Default 0, 
  dEstimatedCost DOUBLE PRECISION NOT NULL Default 0, 
  dRealCost DOUBLE PRECISION NOT NULL Default 0, 
  iBudgetId INTEGER NOT NULL Default 0, 
  iChildcount SMALLINT NOT NULL Default 0, 
  iCommitmentLevel SMALLINT NOT NULL Default 0, 
  iComputationState SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iEnvId INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iIsView SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOrder SMALLINT NOT NULL Default 0, 
  iOrgUnitId INTEGER NOT NULL Default 0, 
  iParentId INTEGER NOT NULL Default 0, 
  iSystem SMALLINT NOT NULL Default 0, 
  iUnSelected SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sEntity VARCHAR(64), 
  sFullName VARCHAR(255), 
  sImageName VARCHAR(80), 
  sImageNamespace VARCHAR(16), 
  sLabel VARCHAR(128), 
  sModel VARCHAR(64), 
  sName VARCHAR(64), 
  sNature VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsEnd DATE, 
  tsLastComputed TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsStart DATE
);

CREATE INDEX XtkFolder_order ON XtkFolder(iOrder);
CREATE INDEX XtkFolder_schemaEntity ON XtkFolder(sEntity);
CREATE UNIQUE INDEX XtkFolder_id ON XtkFolder(iFolderId);
CREATE UNIQUE INDEX XtkFolder_name ON XtkFolder(sName);
CREATE UNIQUE INDEX XtkFolder_fullName ON XtkFolder(sFullName);
CREATE INDEX XtkFolder_parentId ON XtkFolder(iParentId);
CREATE INDEX XtkFolder_orgUnitId ON XtkFolder(iOrgUnitId);
CREATE INDEX XtkFolder_imageNamespace ON XtkFolder(sImageNamespace, sImageName);
CREATE INDEX XtkFolder_modifiedById ON XtkFolder(iModifiedById);
CREATE INDEX XtkFolder_createdById ON XtkFolder(iCreatedById);
CREATE INDEX XtkFolder_envId ON XtkFolder(iEnvId);
CREATE INDEX XtkFolder_budgetId ON XtkFolder(iBudgetId);
  
INSERT INTO XtkFolder (iFolderId) VALUES (0); 

-- Log: Creating table 'XtkFormRendering'


CREATE TABLE XtkFormRendering(
  iCreatedById INTEGER NOT NULL Default 0, 
  iDisplayNavigation SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFormRenderingId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iPageBorder SMALLINT NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sNavigationLabel VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkFormRendering_id ON XtkFormRendering(iFormRenderingId);
CREATE UNIQUE INDEX XtkFormRendering_name ON XtkFormRendering(sInternalName);
CREATE INDEX XtkFormRendering_folderId ON XtkFormRendering(iFolderId);
CREATE INDEX XtkFormRendering_modifiedById ON XtkFormRendering(iModifiedById);
CREATE INDEX XtkFormRendering_createdById ON XtkFormRendering(iCreatedById);
  
INSERT INTO XtkFormRendering (iFormRenderingId) VALUES (0); 

-- Log: Creating table 'XtkJob'


CREATE TABLE XtkJob(
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iJobId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sDesc VARCHAR(512), 
  sEditForm VARCHAR(80), 
  sForm VARCHAR(80), 
  sImg VARCHAR(80), 
  sInternalName VARCHAR(100), 
  sLabel VARCHAR(128), 
  sTimezone VARCHAR(64), 
  sType VARCHAR(32), 
  sXtkschema VARCHAR(80), 
  tsCreated TIMESTAMPTZ, 
  tsEnd TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsStart TIMESTAMPTZ
);

CREATE INDEX XtkJob_label ON XtkJob(iBuiltIn, sLabel);
CREATE UNIQUE INDEX XtkJob_id ON XtkJob(iJobId);
CREATE UNIQUE INDEX XtkJob_internalName ON XtkJob(sInternalName);
CREATE INDEX XtkJob_operationId ON XtkJob(iOperationId);
CREATE INDEX XtkJob_modifiedById ON XtkJob(iModifiedById);
CREATE INDEX XtkJob_createdById ON XtkJob(iCreatedById);
CREATE INDEX XtkJob_folderProcessId ON XtkJob(iFolderProcessId);
CREATE INDEX XtkJob_folderId ON XtkJob(iFolderId);
  
INSERT INTO XtkJob (iJobId) VALUES (0); 

-- Log: Creating table 'XtkJobLog'


CREATE TABLE XtkJobLog(
  iError INTEGER NOT NULL Default 0, 
  iJobId INTEGER NOT NULL Default 0, 
  iJobLogId INTEGER NOT NULL Default 0, 
  iLogType SMALLINT NOT NULL Default 0, 
  sMessage VARCHAR(512), 
  sObject VARCHAR(255), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX XtkJobLog_logDate ON XtkJobLog(iJobId, iJobLogId);
CREATE UNIQUE INDEX XtkJobLog_id ON XtkJobLog(iJobLogId);
  
INSERT INTO XtkJobLog (iJobLogId) VALUES (0); 

-- Log: Creating table 'XtkOlapAggregate'


CREATE TABLE XtkOlapAggregate(
  iCreatedById INTEGER NOT NULL Default 0, 
  iCubeId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOlapAggregateId INTEGER NOT NULL Default 0, 
  iValid SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  mDescription TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkOlapAggregate_id ON XtkOlapAggregate(iOlapAggregateId);
CREATE UNIQUE INDEX XtkOlapAggregate_name ON XtkOlapAggregate(iCubeId, sName);
CREATE INDEX XtkOlapAggregate_modifiedById ON XtkOlapAggregate(iModifiedById);
CREATE INDEX XtkOlapAggregate_createdById ON XtkOlapAggregate(iCreatedById);
  
INSERT INTO XtkOlapAggregate (iOlapAggregateId) VALUES (0); 

-- Log: Creating table 'XtkOlapCube'


CREATE TABLE XtkOlapCube(
  iCreatedById INTEGER NOT NULL Default 0, 
  iFactType SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iListId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOlapCubeId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  mDescription TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sSchema VARCHAR(30), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkOlapCube_id ON XtkOlapCube(iOlapCubeId);
CREATE UNIQUE INDEX XtkOlapCube_name ON XtkOlapCube(sName);
CREATE INDEX XtkOlapCube_folderId ON XtkOlapCube(iFolderId);
CREATE INDEX XtkOlapCube_listId ON XtkOlapCube(iListId);
CREATE INDEX XtkOlapCube_modifiedById ON XtkOlapCube(iModifiedById);
CREATE INDEX XtkOlapCube_createdById ON XtkOlapCube(iCreatedById);
  
INSERT INTO XtkOlapCube (iOlapCubeId) VALUES (0); 

-- Log: Creating table 'XtkOlapDimension'


CREATE TABLE XtkOlapDimension(
  iCreatedById INTEGER NOT NULL Default 0, 
  iCubeId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOlapDimensionId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  mDescription TEXT, 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkOlapDimension_id ON XtkOlapDimension(iOlapDimensionId);
CREATE UNIQUE INDEX XtkOlapDimension_name ON XtkOlapDimension(iCubeId, sName);
CREATE INDEX XtkOlapDimension_modifiedById ON XtkOlapDimension(iModifiedById);
CREATE INDEX XtkOlapDimension_createdById ON XtkOlapDimension(iCreatedById);
  
INSERT INTO XtkOlapDimension (iOlapDimensionId) VALUES (0); 

-- Log: Creating table 'XtkOlapMeasure'


CREATE TABLE XtkOlapMeasure(
  iCreatedById INTEGER NOT NULL Default 0, 
  iCubeId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOlapMeasureId INTEGER NOT NULL Default 0, 
  iSourceMeasureId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  mDescription TEXT, 
  sCubeAlias VARCHAR(50), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sUnit VARCHAR(20), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkOlapMeasure_id ON XtkOlapMeasure(iOlapMeasureId);
CREATE UNIQUE INDEX XtkOlapMeasure_name ON XtkOlapMeasure(iCubeId, sName);
CREATE INDEX XtkOlapMeasure_sourceMeasureI ON XtkOlapMeasure(iSourceMeasureId);
CREATE INDEX XtkOlapMeasure_modifiedById ON XtkOlapMeasure(iModifiedById);
CREATE INDEX XtkOlapMeasure_createdById ON XtkOlapMeasure(iCreatedById);
  
INSERT INTO XtkOlapMeasure (iOlapMeasureId) VALUES (0); 

-- Log: Creating table 'XtkOperator'


CREATE TABLE XtkOperator(
  iCleansed SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iCrmInstanceId INTEGER NOT NULL Default 0, 
  iDashboardId INTEGER NOT NULL Default 0, 
  iDisable SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iLocalOrgUnitId INTEGER NOT NULL Default 0, 
  iManagerId INTEGER NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  iReportsToId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sAddress1 VARCHAR(255), 
  sAddress2 VARCHAR(255), 
  sAddress3 VARCHAR(255), 
  sAddress4 VARCHAR(80), 
  sBusinessPhone VARCHAR(120), 
  sCity VARCHAR(120), 
  sCompanyRaw VARCHAR(255), 
  sCountryCode VARCHAR(3), 
  sCountryRaw VARCHAR(120), 
  sCrmUserId VARCHAR(36), 
  sDepartment VARCHAR(80), 
  sDesc VARCHAR(512), 
  sEmail VARCHAR(128), 
  sExternalId VARCHAR(64), 
  sHomePhone VARCHAR(120), 
  sJobTitle VARCHAR(240), 
  sLabel VARCHAR(128), 
  sMobilePhone VARCHAR(120), 
  sName VARCHAR(64), 
  sPassword VARCHAR(64), 
  sStateCode VARCHAR(3), 
  sStateRaw VARCHAR(50), 
  sTheme VARCHAR(64), 
  sTimezone VARCHAR(64), 
  sZipCode VARCHAR(60), 
  tsCreated TIMESTAMPTZ, 
  tsCrmLastModified TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE INDEX XtkOperator_label ON XtkOperator(iType, sLabel);
CREATE UNIQUE INDEX XtkOperator_id ON XtkOperator(iOperatorId);
CREATE UNIQUE INDEX XtkOperator_name ON XtkOperator(iType, sName);
CREATE INDEX XtkOperator_folderId ON XtkOperator(iFolderId);
CREATE INDEX XtkOperator_modifiedById ON XtkOperator(iModifiedById);
CREATE INDEX XtkOperator_createdById ON XtkOperator(iCreatedById);
CREATE INDEX XtkOperator_crmInstanceId ON XtkOperator(iCrmInstanceId);
CREATE INDEX XtkOperator_managerId ON XtkOperator(iManagerId);
CREATE INDEX XtkOperator_dashboardId ON XtkOperator(iDashboardId);
CREATE INDEX XtkOperator_localOrgUnitId ON XtkOperator(iLocalOrgUnitId);
CREATE INDEX XtkOperator_reportsToId ON XtkOperator(iReportsToId);
  
INSERT INTO XtkOperator (iOperatorId) VALUES (0); 

-- Log: Creating table 'XtkOperatorGroup'


CREATE TABLE XtkOperatorGroup(
  iGroupId INTEGER NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX XtkOperatorGroup_id ON XtkOperatorGroup(iGroupId, iOperatorId);
CREATE INDEX XtkOperatorGroup_operatorId ON XtkOperatorGroup(iOperatorId);
  
-- Log: Creating table 'XtkOption'


CREATE TABLE XtkOption(
  dDoubleValue DOUBLE PRECISION NOT NULL Default 0, 
  iDataType SMALLINT NOT NULL Default 0, 
  iLongValue INTEGER NOT NULL Default 0, 
  iOptionId INTEGER NOT NULL Default 0, 
  iType SMALLINT NOT NULL Default 0, 
  mMemoValue TEXT, 
  sDesc VARCHAR(512), 
  sName VARCHAR(128), 
  sStringValue VARCHAR(255), 
  tsTimeStampValue TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkOption_id ON XtkOption(iOptionId);
CREATE UNIQUE INDEX XtkOption_name ON XtkOption(sName);
  
INSERT INTO XtkOption (iOptionId) VALUES (0); 

-- Log: Creating table 'XtkPackageInstall'


CREATE TABLE XtkPackageInstall(
  iPackageInstallId INTEGER NOT NULL Default 0, 
  sLabel VARCHAR(80), 
  sName VARCHAR(16), 
  tsInstall TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkPackageInstall_id ON XtkPackageInstall(iPackageInstallId);
  
INSERT INTO XtkPackageInstall (iPackageInstallId) VALUES (0); 

-- Log: Creating table 'XtkPkgInstRel'


CREATE TABLE XtkPkgInstRel(
  iPackageInstallId INTEGER NOT NULL Default 0, 
  sPackageName VARCHAR(80), 
  sPackageNamespace VARCHAR(16)
);

CREATE UNIQUE INDEX XtkPkgInstRel_id ON XtkPkgInstRel(iPackageInstallId, sPackageNamespace, sPackageName);
CREATE INDEX XtkPkgInstRel_packageNamespac ON XtkPkgInstRel(sPackageNamespace, sPackageName);
  
-- Log: Creating table 'XtkQueryFilter'


CREATE TABLE XtkQueryFilter(
  iCreatedById INTEGER NOT NULL Default 0, 
  iDefault SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iHasForm SMALLINT NOT NULL Default 0, 
  iMain SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iQueryFilterId INTEGER NOT NULL Default 0, 
  iShared SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  sDesc VARCHAR(512), 
  sImg VARCHAR(64), 
  sLabel VARCHAR(128), 
  sName VARCHAR(64), 
  sSchema VARCHAR(64), 
  sSqlTable VARCHAR(64), 
  sStartPath VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkQueryFilter_id ON XtkQueryFilter(iQueryFilterId);
CREATE UNIQUE INDEX XtkQueryFilter_name ON XtkQueryFilter(sName);
CREATE INDEX XtkQueryFilter_folderId ON XtkQueryFilter(iFolderId);
CREATE INDEX XtkQueryFilter_modifiedById ON XtkQueryFilter(iModifiedById);
CREATE INDEX XtkQueryFilter_createdById ON XtkQueryFilter(iCreatedById);
  
INSERT INTO XtkQueryFilter (iQueryFilterId) VALUES (0); 

-- Log: Creating table 'XtkReject'


CREATE TABLE XtkReject(
  iJobId INTEGER NOT NULL Default 0, 
  iRejectId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sConnectorType VARCHAR(64), 
  sDataTransferStep VARCHAR(80), 
  sMessage VARCHAR(255), 
  sOrigin VARCHAR(80), 
  sRejectLogType VARCHAR(16), 
  sSchema VARCHAR(80), 
  sStartPath VARCHAR(80), 
  tsLog TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkReject_id ON XtkReject(iRejectId);
CREATE INDEX XtkReject_dataTransferId ON XtkReject(iJobId);
  
INSERT INTO XtkReject (iRejectId) VALUES (0); 

-- Log: Creating table 'XtkReport'


CREATE TABLE XtkReport(
  iAppState SMALLINT NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iDefaultDictionaryId INTEGER NOT NULL Default 0, 
  iFolderFilter SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iIdCounter INTEGER NOT NULL Default 0, 
  iIsGlobal SMALLINT NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iMonoselection SMALLINT NOT NULL Default 0, 
  iMultiselection SMALLINT NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  iOrder INTEGER NOT NULL Default 0, 
  iPrefered SMALLINT NOT NULL Default 0, 
  iRenderingId INTEGER NOT NULL Default 0, 
  iReportId INTEGER NOT NULL Default 0, 
  iShared SMALLINT NOT NULL Default 0, 
  iState SMALLINT NOT NULL Default 0, 
  iTargetReportId INTEGER NOT NULL Default 0, 
  iTranslationStatus SMALLINT NOT NULL Default 0, 
  mData TEXT, 
  mVisibleIfSql TEXT, 
  sCategory VARCHAR(128), 
  sDefaultLanguage VARCHAR(255), 
  sDesc VARCHAR(512), 
  sDesignLanguage VARCHAR(255), 
  sHistoryComputeString VARCHAR(128), 
  sImg VARCHAR(64), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLabelExpr VARCHAR(255), 
  sLink VARCHAR(80), 
  sSchema VARCHAR(80), 
  sSchemaLink VARCHAR(80), 
  sType VARCHAR(20), 
  sVisibleIfExpr VARCHAR(255), 
  tsCreated TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsPublication TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkReport_id ON XtkReport(iReportId);
CREATE UNIQUE INDEX XtkReport_name ON XtkReport(sInternalName);
CREATE INDEX XtkReport_folderProcessId ON XtkReport(iFolderProcessId);
CREATE INDEX XtkReport_targetReportId ON XtkReport(iTargetReportId);
CREATE INDEX XtkReport_renderingId ON XtkReport(iRenderingId);
CREATE INDEX XtkReport_folderId ON XtkReport(iFolderId);
CREATE INDEX XtkReport_operatorId ON XtkReport(iOperatorId);
CREATE INDEX XtkReport_defaultDictionaryId ON XtkReport(iDefaultDictionaryId);
CREATE INDEX XtkReport_modifiedById ON XtkReport(iModifiedById);
CREATE INDEX XtkReport_createdById ON XtkReport(iCreatedById);
  
INSERT INTO XtkReport (iReportId) VALUES (0); 

-- Log: Creating table 'XtkReportHistory'


CREATE TABLE XtkReportHistory(
  iCreatedById INTEGER NOT NULL Default 0, 
  iOfficeJavascriptId INTEGER NOT NULL Default 0, 
  iReportHistoryId INTEGER NOT NULL Default 0, 
  iShared SMALLINT NOT NULL Default 0, 
  iUsed SMALLINT NOT NULL Default 0, 
  iWebJavascriptId INTEGER NOT NULL Default 0, 
  mContent TEXT, 
  sContext VARCHAR(64), 
  sDesc VARCHAR(255), 
  sEntitySchema VARCHAR(255), 
  sReportName VARCHAR(255), 
  sSelection VARCHAR(255), 
  tsCreated TIMESTAMPTZ
);

CREATE INDEX XtkReportHistory_created ON XtkReportHistory(tsCreated);
CREATE INDEX XtkReportHistory_report ON XtkReportHistory(sReportName, sContext, tsCreated);
CREATE UNIQUE INDEX XtkReportHistory_id ON XtkReportHistory(iReportHistoryId);
CREATE INDEX XtkReportHistory_officeJavasc ON XtkReportHistory(iOfficeJavascriptId);
CREATE INDEX XtkReportHistory_webJavascrip ON XtkReportHistory(iWebJavascriptId);
CREATE INDEX XtkReportHistory_createdById ON XtkReportHistory(iCreatedById);
  
INSERT INTO XtkReportHistory (iReportHistoryId) VALUES (0); 

-- Log: Creating table 'XtkReportRights'


CREATE TABLE XtkReportRights(
  iOperatorId INTEGER NOT NULL Default 0, 
  iReportId INTEGER NOT NULL Default 0
);

CREATE UNIQUE INDEX XtkReportRights_id ON XtkReportRights(iOperatorId, iReportId);
CREATE INDEX XtkReportRights_reportId ON XtkReportRights(iReportId);
  
-- Log: Creating table 'XtkRights'


CREATE TABLE XtkRights(
  iFolderId INTEGER NOT NULL Default 0, 
  iInherit SMALLINT NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  iPropagate SMALLINT NOT NULL Default 0, 
  sRights VARCHAR(255)
);

CREATE UNIQUE INDEX XtkRights_id ON XtkRights(iOperatorId, iFolderId);
CREATE INDEX XtkRights_folderId ON XtkRights(iFolderId);
  
-- Log: Creating table 'XtkWorkflow'


CREATE TABLE XtkWorkflow(
  iAggregateId INTEGER NOT NULL Default 0, 
  iBuiltIn SMALLINT NOT NULL Default 0, 
  iCreatedById INTEGER NOT NULL Default 0, 
  iErrorLimit INTEGER NOT NULL Default 0, 
  iFailed SMALLINT NOT NULL Default 0, 
  iFolderId INTEGER NOT NULL Default 0, 
  iFolderProcessId INTEGER NOT NULL Default 0, 
  iForecasted SMALLINT NOT NULL Default 0, 
  iHistory INTEGER NOT NULL Default 0, 
  iInProcess SMALLINT NOT NULL Default 0, 
  iIsModel SMALLINT NOT NULL Default 0, 
  iModifiedById INTEGER NOT NULL Default 0, 
  iOnError SMALLINT NOT NULL Default 0, 
  iOperationId INTEGER NOT NULL Default 0, 
  iOrder INTEGER NOT NULL Default 0, 
  iPort INTEGER NOT NULL Default 0, 
  iPriority SMALLINT NOT NULL Default 0, 
  iProcessId INTEGER NOT NULL Default 0, 
  iProduction SMALLINT NOT NULL Default 0, 
  iRecurrentMdl SMALLINT NOT NULL Default 0, 
  iRoutingOperationId INTEGER NOT NULL Default 0, 
  iStartState SMALLINT NOT NULL Default 0, 
  iState SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iSupervisorId INTEGER NOT NULL Default 0, 
  iUnlockedCount INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  mVisualState TEXT, 
  sDesc VARCHAR(2000), 
  sForm VARCHAR(80), 
  sHostname VARCHAR(64), 
  sInternalName VARCHAR(64), 
  sLabel VARCHAR(128), 
  sLogin VARCHAR(64), 
  sNextProcessingAfn VARCHAR(40), 
  sNextProcessingHost VARCHAR(64), 
  sTimezone VARCHAR(64), 
  tsCreated TIMESTAMPTZ, 
  tsExpiration TIMESTAMPTZ, 
  tsLastModified TIMESTAMPTZ, 
  tsLastStart TIMESTAMPTZ, 
  tsNextProcessing TIMESTAMPTZ, 
  tsProcess TIMESTAMPTZ
);

CREATE INDEX XtkWorkflow_label ON XtkWorkflow(sLabel);
CREATE UNIQUE INDEX XtkWorkflow_id ON XtkWorkflow(iWorkflowId);
CREATE UNIQUE INDEX XtkWorkflow_name ON XtkWorkflow(sInternalName);
CREATE INDEX XtkWorkflow_aggregateId ON XtkWorkflow(iAggregateId);
CREATE INDEX XtkWorkflow_routingOperationI ON XtkWorkflow(iRoutingOperationId);
CREATE INDEX XtkWorkflow_operationId ON XtkWorkflow(iOperationId);
CREATE INDEX XtkWorkflow_folderProcessId ON XtkWorkflow(iFolderProcessId);
CREATE INDEX XtkWorkflow_folderId ON XtkWorkflow(iFolderId);
CREATE INDEX XtkWorkflow_supervisorId ON XtkWorkflow(iSupervisorId);
CREATE INDEX XtkWorkflow_modifiedById ON XtkWorkflow(iModifiedById);
CREATE INDEX XtkWorkflow_createdById ON XtkWorkflow(iCreatedById);
  
INSERT INTO XtkWorkflow (iWorkflowId) VALUES (0); 

-- Log: Creating table 'XtkWorkflowEvent'


CREATE TABLE XtkWorkflowEvent(
  iEventIdentifier INTEGER NOT NULL Default 0, 
  iKeepResult SMALLINT NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iWorkflowEventId INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sActivity VARCHAR(64), 
  sTransition VARCHAR(64), 
  tsCreation TIMESTAMPTZ, 
  tsNextProcessing TIMESTAMPTZ, 
  tsProcessing TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkWorkflowEvent_id ON XtkWorkflowEvent(iWorkflowEventId);
CREATE UNIQUE INDEX XtkWorkflowEvent_evId ON XtkWorkflowEvent(iEventIdentifier, iWorkflowId);
CREATE INDEX XtkWorkflowEvent_workflowId ON XtkWorkflowEvent(iWorkflowId);
  
INSERT INTO XtkWorkflowEvent (iWorkflowEventId) VALUES (0); 

-- Log: Creating table 'XtkWorkflowJob'


CREATE TABLE XtkWorkflowJob(
  iCommand SMALLINT NOT NULL Default 0, 
  iLoginId INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  iWorkflowJobId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sAffinity VARCHAR(40), 
  sHostname VARCHAR(64), 
  sLoginCS VARCHAR(128), 
  tsCreated TIMESTAMPTZ, 
  tsNextProcessing TIMESTAMPTZ
);

CREATE UNIQUE INDEX XtkWorkflowJob_id ON XtkWorkflowJob(iWorkflowJobId);
CREATE INDEX XtkWorkflowJob_loginId ON XtkWorkflowJob(iLoginId);
CREATE INDEX XtkWorkflowJob_workflowId ON XtkWorkflowJob(iWorkflowId);
  
INSERT INTO XtkWorkflowJob (iWorkflowJobId) VALUES (0); 

-- Log: Creating table 'XtkWorkflowLog'


CREATE TABLE XtkWorkflowLog(
  iError INTEGER NOT NULL Default 0, 
  iLogType SMALLINT NOT NULL Default 0, 
  iTaskId INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  iWorkflowLogId INTEGER NOT NULL Default 0, 
  sActivity VARCHAR(64), 
  sMessage VARCHAR(512), 
  tsLog TIMESTAMPTZ
);

CREATE INDEX XtkWorkflowLog_logDate ON XtkWorkflowLog(iWorkflowId, tsLog);
CREATE UNIQUE INDEX XtkWorkflowLog_id ON XtkWorkflowLog(iWorkflowLogId);
  
INSERT INTO XtkWorkflowLog (iWorkflowLogId) VALUES (0); 

-- Log: Creating table 'XtkWorkflowLogin'


CREATE TABLE XtkWorkflowLogin(
  iWorkflowId INTEGER NOT NULL Default 0, 
  iWorkflowLoginId INTEGER NOT NULL Default 0, 
  sLogin VARCHAR(64)
);

CREATE UNIQUE INDEX XtkWorkflowLogin_id ON XtkWorkflowLogin(iWorkflowLoginId);
  
INSERT INTO XtkWorkflowLogin (iWorkflowLoginId) VALUES (0); 

-- Log: Creating table 'XtkWorkflowTask'


CREATE TABLE XtkWorkflowTask(
  dMaxExecutionTime DOUBLE PRECISION, 
  iAbortReason SMALLINT NOT NULL Default 0, 
  iAssigneeId INTEGER NOT NULL Default 0, 
  iAssigneeType SMALLINT NOT NULL Default 0, 
  iLastErrorCode INTEGER NOT NULL Default 0, 
  iObjectId INTEGER NOT NULL Default 0, 
  iOperatorId INTEGER NOT NULL Default 0, 
  iProcessingCount INTEGER NOT NULL Default 0, 
  iStatus SMALLINT NOT NULL Default 0, 
  iTaskIdentifier INTEGER NOT NULL Default 0, 
  iWorkflowId INTEGER NOT NULL Default 0, 
  iWorkflowTaskId INTEGER NOT NULL Default 0, 
  mData TEXT, 
  sActivity VARCHAR(64), 
  sAssigneeFilter VARCHAR(255), 
  sHostname VARCHAR(64), 
  sObjectSchema VARCHAR(255), 
  sTitle VARCHAR(255), 
  tsCompletion TIMESTAMPTZ, 
  tsCreation TIMESTAMPTZ, 
  tsNextProcessing TIMESTAMPTZ, 
  tsProcessing TIMESTAMPTZ, 
  tsRunning TIMESTAMPTZ
);

CREATE INDEX XtkWorkflowTask_creation ON XtkWorkflowTask(tsCreation);
CREATE UNIQUE INDEX XtkWorkflowTask_id ON XtkWorkflowTask(iWorkflowTaskId);
CREATE UNIQUE INDEX XtkWorkflowTask_taskIdentifier ON XtkWorkflowTask(iTaskIdentifier, iWorkflowId);
CREATE INDEX XtkWorkflowTask_operatorId ON XtkWorkflowTask(iOperatorId);
CREATE INDEX XtkWorkflowTask_assigneeId ON XtkWorkflowTask(iAssigneeId);
CREATE INDEX XtkWorkflowTask_workflowId ON XtkWorkflowTask(iWorkflowId);
  
INSERT INTO XtkWorkflowTask (iWorkflowTaskId) VALUES (0); 
