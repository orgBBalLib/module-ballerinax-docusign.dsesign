// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Specifies the envelope recipients.
public type Recipients record {
    # A list of agent recipients assigned to the documents.
    Agent[] agents?;
    # A list of carbon copy recipients assigned to the documents.
    CarbonCopy[] carbonCopies?;
    # A complex type containing information on a recipient the must receive the completed documents for the envelope to be completed, but the recipient does not need to sign, initial, date, or add information to any of the documents.
    CertifiedDelivery[] certifiedDeliveries?;
    # The routing order of the current recipient. If this value equals a particular signer's routing order, it indicates that the envelope has been sent to that recipient, but he or she has not completed the required actions.
    string currentRoutingOrder?;
    # A list of users who can edit the envelope.
    Editor[] editors?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Specifies a signer that is in the same physical location as a DocuSign user who will act as a Signing Host for the transaction. The recipient added is the Signing Host and new separate Signer Name field appears after Sign in person is selected.
    InPersonSigner[] inPersonSigners?;
    # Identifies a recipient that can, but is not required to, add name and email information for recipients at the same or subsequent level in the routing order (until subsequent Agents, Editors or Intermediaries recipient types are added).
    Intermediary[] intermediaries?;
    # A list of notary recipients on the envelope.
    NotaryRecipient[] notaries?;
    #
    Participant[] participants?;
    # The number of recipients in the envelope.
    string recipientCount?;
    # A list of electronic seals to apply to documents.
    SealSign[] seals?;
    # A list of signers on the envelope.
    Signer[] signers?;
    # A list of signers who act as witnesses on the envelope.
    Witness[] witnesses?;
};

# Represents the transaction status of an envelope in the DocuSign system.
public type EnvelopeTransactionStatus record {
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Indicates the envelope status. Valid values are:
    #
    # * `completed`: The recipients have finished working with the envelope: the documents are signed and all required tabs are filled in.
    # * `created`: The envelope is created as a draft. It can be modified and sent later.
    # * `declined`: The envelope has been declined by the recipients.
    # * `delivered`: The envelope has been delivered to the recipients.
    # * `sent`: The envelope will be sent to the recipients after the envelope is created.
    # * `signed`: The envelope has been signed by the recipients.
    # * `voided`: The envelope is no longer valid and recipients cannot access or sign the envelope.
    string status?;
    # Used to identify an envelope. The ID is a sender-generated value and is valid in the DocuSign system for 7 days. It is recommended that a transaction ID is used for offline signing to ensure that an envelope is not sent multiple times. The `transactionId` property can be used determine an envelope's status (i.e. was it created or not) in cases where the internet connection was lost before the envelope status was returned.
    string transactionId?;
};

# Represents the responsive HTML configuration for a document
public type DocumentResponsiveHtml record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# Document Visibility enables senders to control the visibility of the documents in an envelope at the recipient level. For example, if the parties associated with a legal proceeding should have access to different documents, the Document Visibility feature enables you to keep all of the documents in the same envelope and set view permissions for the documents by recipient. This functionality is enabled for envelopes and templates. It is not available for PowerForms.
#
# **Note:** Before you use Document Visibility, you should be aware of the following information:
#
# - Document Visibility must be enabled for your account by your DocuSign administrator. 
# - A document cannot be hidden from a recipient if the recipient has tabs assigned to them on the document. 
# - When the Document Visibility setting hides a document from a recipient, the document also does not appear in the recipient's list of envelopes, documents, or page images.
# - Carbon Copy, Certified Delivery (Needs to Sign), Editor, and Agent recipients can always see all of the documents associated with the envelope or template.
#
# The Document Visibility feature has multiple settings that specify the options that senders have when sending documents. For more information, see [Use Document Visibility to Control Recipient Access](https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=eui1578456411411.html).
public type TemplateDocumentVisibility record {
    # An array of `documentVisibility` objects that specifies which documents are visible to which recipients.
    DocumentVisibility[] documentVisibility?;
};

# Represents the electronic seal providers for an account.
public type AccountSealProviders record {
    # A list of electronic seals to apply to documents.
    SealIdentifier[] seals?;
};

# Represents the information related to a downgrade request
public type DowngradeRequestInformation record {
    #
    string downgradeRequestCreation?;
    #
    string downgradeRequestProductId?;
    #
    string downgradeRequestStatus?;
};

# Summary status of a single batch.
public type BulkSendBatchSummary record {
    #
    string action?;
    #
    string actionStatus?;
    # The batch ID.
    string batchId?;
    # The name of the batch.
    string batchName?;
    # The number of envelopes in the batch.
    string batchSize?;
    # The batch details URI.
    string batchUri?;
    # Number of envelopes that failed to send.
    string failed?;
    # Number of envelopes peding processing.
    string queued?;
    # Number of envelopes that have been sent.
    string sent?;
    # The time stamp of when the batch was created in ISO 8601 format.
    string submittedDate?;
};

# Defines a billing plans response object.
public type BillingPlansResponse record {
    # Reserved for DocuSign.
    BillingPlan[] billingPlans?;
};

# Represents the watermark settings for an account.
public type AccountWatermarks record {
    #
    string displayAngle?;
    #
    string enabled?;
    # The font to be used for the tab value. Supported fonts include:
    #
    # - Default
    # - Arial
    # - ArialNarrow
    # - Calibri
    # - CourierNew
    # - Garamond
    # - Georgia
    # - Helvetica
    # - LucidaConsole
    # - MSGothic
    # - MSMincho
    # - OCR-A
    # - Tahoma
    # - TimesNewRoman
    # - Trebuchet
    # - Verdana
    string font?;
    # The font color to use for the information in the tab. Possible values are: 
    #
    # - Black
    # - BrightBlue
    # - BrightRed
    # - DarkGreen
    # - DarkRed
    # - Gold
    # - Green
    # - NavyBlue
    # - Purple
    # - White
    string fontColor?;
    # The font size used for the information in the tab. Possible values are:
    #
    # - Size7
    # - Size8
    # - Size9
    # - Size10
    # - Size11
    # - Size12
    # - Size14
    # - Size16
    # - Size18
    # - Size20
    # - Size22
    # - Size24
    # - Size26
    # - Size28
    # - Size36
    # - Size48
    # - Size72
    string fontSize?;
    # A unique ID for the Salesforce object.
    string id?;
    #
    string imageBase64?;
    #
    string transparency?;
    #
    string watermarkText?;
};

# Represents the response from a bulk process operation.
public type BulkProcessResponse record {
    # Identifier used to query the status of an individual bulk recipient batch.
    string batchId?;
    #
    string batchName?;
    # The total number of items in the batch being queried.
    string batchSize?;
    # Error details.
    string[] errorDetails?;
    #
    string[] errors?;
    #
    string queueLimit?;
    #
    string totalQueued?;
};

# Represents the types of credit cards that are supported.
public type CreditCardTypes record {
    # An array containing supported credit card types.
    string[] cardTypes?;
};

# Defines a billing payments response object.
public type BillingPaymentsResponse record {
    # Reserved for DocuSign.
    BillingPaymentItem[] billingPayments?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
};

# Contains details about the permission profiles associated with an account.
public type PermissionProfileInformation record {
    # A complex type containing a collection of permission profiles.
    PermissionProfile[] permissionProfiles?;
};

# An object that contains information about the chunked upload part.
public type ChunkedUploadPart record {
    # The order of the part in the chunked upload.
    string sequence?;
    # The size of the part in bytes. 
    #
    # DocuSign recommends that a chunked upload part is no larger than a few MB in size.
    string size?;
};

# Contains information about an account billing plan.
public type AccountBillingPlan record {
    # Reserved for DocuSign.
    AddOn[] addOns?;
    #
    string appStoreReceiptExpirationDate?;
    #
    string appStoreReceiptPurchaseDate?;
    # Reserved for DocuSign.
    string canCancelRenewal?;
    # When **true,** specifies that you can upgrade the account through the API. For GET methods, you must set the `include_metadata` query parameter to **true** for this property to appear in the response.
    string canUpgrade?;
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code to use for the account.
    string currencyCode?;
    #
    DowngradePlanUpdateResponse downgradePlanInformation?;
    # When **true,** customer support is provided as part of the account plan.
    string enableSupport?;
    # The number of seats (users) included in the plan.
    string includedSeats?;
    # Reserved for DocuSign.
    string incrementalSeats?;
    # When **true,** the account has been downgraded from a premium account type. Otherwise **false.**
    string isDowngrade?;
    #
    string notificationType?;
    # Any other percentage discount for the plan. 
    string otherDiscountPercent?;
    # The payment cycle associated with the plan. Valid values: 
    #
    # - `Monthly`
    # - `Annually` 
    string paymentCycle?;
    # The payment method used with the plan. Valid values: CreditCard, PurchaseOrder, Premium, or Freemium. 
    string paymentMethod?;
    # The per-seat price associated with the plan.
    #
    # Example: `"456.0000"`
    string perSeatPrice?;
    # Identifies the type of plan. Examples include:
    #
    # - `business`
    # - `corporate`
    # - `enterprise` 
    # - `free`
    string planClassification?;
    # A complex type that sets the feature sets for the account. It contains the following information (all string content):
    #
    # * currencyFeatureSetPrices - Contains the currencyCode and currencySymbol for the alternate currency values for envelopeFee, fixedFee, seatFee that are configured for this plan feature set.
    # * envelopeFee - An incremental envelope cost for plans with envelope overages (when isEnabled=true).
    # * featureSetId - A unique ID for the feature set.
    # * fixedFee - A one-time fee associated with the plan (when isEnabled=true).
    # * isActive - Specifies whether the feature set is actively set as part of the plan.
    # * isEnabled - Specifies whether the feature set is actively enabled as part of the plan.
    # * name - The name of the feature set.
    # * seatFee - An incremental seat cost for seat-based plans (when isEnabled=true).
    FeatureSet[] planFeatureSets?;
    # DocuSign's ID for the account plan.
    string planId?;
    # The name of the Billing Plan.
    string planName?;
    # The date that the Account started using the current plan.
    string planStartDate?;
    # The Product ID from the AppStore.
    string productId?;
    #
    string renewalDate?;
    # The renewal status for the account. Valid values are:
    #
    # * `auto`: The account automatically renews.
    # * `queued_for_close`: The account will be closed at the `billingPeriodEndDate`.
    # * `queued_for_downgrade`: The account will be downgraded at the `billingPeriodEndDate`.
    #
    # **Note:** For GET methods, you must set the `include_metadata` query parameter to **true** for this property to appear in the response.
    string renewalStatus?;
    # A complex type that contains any seat discount information. Valid values:
    #
    # - `BeginSeatCount` 
    # - `EndSeatCount`
    # - `SeatDiscountPercent`
    #
    SeatDiscount[] seatDiscounts?;
    #
    string subscriptionStartDate?;
    # The support incident fee charged for each support incident.
    #
    # Example: `"$0.00"`
    string supportIncidentFee?;
    # The support plan fee charged for this plan.
    #
    # Example: `"$0.00"`
    string supportPlanFee?;
    #
    string taxExemptId?;
};

# Represents a list of notary journals.
public type NotaryJournalList record {
    # The last index position in the result set. 
    string endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    #
    NotaryJournal[] notaryJournals?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# Contains information about custom fields.
public type CustomFields record {
    # An array of list custom fields.
    ListCustomField[] listCustomFields?;
    # An array of text custom fields.
    TextCustomField[] textCustomFields?;
};

# Represents the pricing information for billing.
public type BillingPrice record {
    # Reserved for DocuSign.
    string beginQuantity?;
    #
    string endQuantity?;
    # Reserved for DocuSign.
    string unitPrice?;
};

# Represents the result of a user's social ID query.
public type UserSocialIdResult record {
    # Contains properties that map a DocuSign user to a social account such as Facebook or Yahoo.
    SocialAccountInformation[] socialAccountInformation?;
    # The ID of the user to access.
    #
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# Represents a notary journal.
public type NotaryJournals record {
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    #
    string documentName?;
    # Describes the jurisdiction of a notary.
    # This is read-only object.
    Jurisdiction jurisdiction?;
    #
    string notaryJournalId?;
    #
    NotaryJournalMetaData notaryJournalMetaData?;
    # The in-person signer's full legal name.
    #
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `name` instead.
    #
    # Maximum Length: 100 characters.
    string signerName?;
};

# Result of `getBulkSendBatchStatus`
public type BulkSendBatchStatus record {
    #
    string action?;
    #
    string actionStatus?;
    # The batch ID.
    string batchId?;
    # The batch name.
    string batchName?;
    # The number of of bulk envelopes submitted in the current batch
    string batchSize?;
    # An array of error statuses.
    BulkSendErrorStatus[] bulkErrors?;
    # The ID of the draft envelope or template that was used to create the batch.
    string envelopeIdOrTemplateId?;
    #
    BulkSendEnvelopesInfo envelopesInfo?;
    # The URI to get all envelopes sent in the batch.
    string envelopesUri?;
    # The number of envelopes that failed to process or send.
    string failed?;
    # The ID of the mailing list used to create the batch.
    string mailingListId?;
    #
    string mailingListName?;
    #
    string ownerUserId?;
    # The number of envelopes waiting in pending queue
    string queued?;
    #
    string resendsRemaining?;
    # The ID of the sender.
    string senderUserId?;
    # The number of envelopes sent successfully.
    string sent?;
    # The timestamp of  when the batch was submitted in ISO 8601 format.
    string submittedDate?;
};

# Represents a collection of logs related to Connect.
public type ConnectLogs record {
    # An array of containing failure information from the Connect failure log.
    ConnectLog[] failures?;
    # A list of Connect general logs.
    ConnectLog[] logs?;
    # The count of records in the log list.
    string totalRecords?;
    # The type of this tab. Values are:
    #
    # - `Approve`
    # - `CheckBox`
    # - `Company`
    # - `Date`
    # - `DateSigned`
    # - `Decline`
    # - `Email`
    # - `EmailAddress`
    # - `EnvelopeId`
    # - `FirstName`
    # - `Formula`
    # - `FullName`
    # - `InitialHere`
    # - `InitialHereOptional`
    # - `LastName`
    # - `List`
    # - `Note`
    # - `Number`
    # - `Radio`
    # - `SignerAttachment`
    # - `SignHere`
    # - `SignHereOptional`
    # - `Ssn`
    # - `Text`
    # - `Title`
    # - `Zip5`
    # - `Zip5Dash4`
    string 'type?;
};

# Users' custom settings
public type UserCustomSettings record {
    # The name/value pair information for the user custom setting.
    NameValue[] customSettings?;
};

# Represents provisioning information for an account.
public type ProvisioningInformation record {
    #
    string defaultConnectionId?;
    #
    string defaultPlanId?;
    # The code that identifies the billing plan groups and plans for the new account.
    string distributorCode?;
    # The password for the `distributorCode`.
    string distributorPassword?;
    #
    string passwordRuleText?;
    #
    string planPromotionText?;
    #
    string purchaseOrderOrPromAllowed?;
};

# Provides a URL that you can embed in your application
# to provide access to the DocuSign UI.
#
# ### Related topics
#
# - [Embedded signing and sending](/docs/esign-rest-api/esign101/concepts/embedding/)
# - [Send an envelope via your app](/docs/esign-rest-api/how-to/embedded-sending/)
# - [Introducing customizable embedded sending](https://www.docusign.com/blog/developers/introducing-customizable-embedded-sending)
public type EnvelopeViews record {
    # The view URL to be navigated to.
    string url?;
};

# Represents a list of integrated user information.
public type IntegratedUserInfoList record {
    #
    string allUsersSelected?;
    # The last index position in the result set. 
    string endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
    # User management information.
    UserInfo[] users?;
};

# This response objects shows the updated details for the contacts.
public type ContactUpdateResponse record {
    # A list of contacts.
    Contact[] contacts?;
};

# Folders allow you to organize envelopes and templates.
public type Folders record {
    # The last index position in the result set. 
    string endPosition?;
    # A list of envelopes in this folder.
    EnvelopeSummary[] envelopes?;
    # A list of folder objects.
    Folder[] folders?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# The object contains the response to a bulk send request.
public type BulkSendResponse record {
    # A batch identifier that you can use to get the status of the batch.
    string batchId?;
    #
    string batchName?;
    # The total number of items in the batch being queried.
    string batchSize?;
    # The GUID of the envelope or template that was sent.
    string envelopeOrTemplateId?;
    # A human-readable object that describes errors that occur. It is only valid for responses and ignored in requests.
    string[] errorDetails?;
    # A list of errors that occurred. This information is intended to be parsed by machine.
    string[] errors?;
    #
    string queueLimit?;
    #
    string totalQueued?;
};

# Represents the responsive HTML for a document.
public type ResponsiveHtml record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# Represents the response to a request for billing entity information.
public type BillingEntityInformationResponse record {
    # The type of billing method on the account. Valid values are: 
    #
    # - `direct`
    # - `web`
    string billingProfile?;
    #
    string entityName?;
    #
    string externalEntityId?;
    #
    string isExternallyBilled?;
};

# Contains information about a DocuSign Connect configuration.
public type ConnectConfigurations record {
    # When **true,** data is sent to the `urlToPublishTo` web address. The default value for this property is **false,** which will stop sending data while maintaining the Connect configuration information.
    string allowEnvelopePublish?;
    # When **true,** DocuSign sends data to the designated Salesforce account through Connect. The default value is **true.**
    string allowSalesforcePublish?;
    # When **true,** the tracked envelope and recipient events for all users, including users that are added a later time, are sent through Connect. The default value is **false.**
    #
    # **Note:** If this property is **false,** make sure you set the `userIds` property to a non-empty array of user IDs.
    string allUsers?;
    # This flag allows you to toggle between including and excluding specified users from the configuration. When **false,** the users corresponding to the IDs in `userIds` will be included in the configuration. Conversely, when **true,** the users will be excluded from the configuration. The default value is **false.**
    string allUsersExcept?;
    # If you are using merge fields, this property specifies the type of the merge field. The only supported value is `salesforce`.
    string configurationType?;
    # The DocuSign-generated ID for the Connect configuration. This property is read-only.
    string connectId?;
    #
    string deliveryMode?;
    #
    string disabledBy?;
    # When **true,** Connect logging is turned on. DocuSign recommends that you enable this functionality to help troubleshoot any issues. 
    #
    # You can have a maximum of 100 active logs in your account. You can view the entries in active logs in the **Logs** tab in the Connect console.
    string enableLog?;
    # An array of strings that lists envelope-related events to track through Connect. The possible event values are: 
    #
    # - `sent`: An envelope has the status `sent` in the following scenarios:
    # - When the envelope has been sent to recipients.
    # - When using remote signing, this event is triggered when the email notification with a link to the documents is sent to at least one recipient.
    # - When using embedded signing, this event is triggered when the link is ready for the recipient to sign the envelope.
    #
    # An envelope remains in this state until all recipients have viewed or taken action on the envelope.
    #
    # - `delivered`: This status is triggered when all recipients have opened the envelope, selected the **Continue** button in the interface, and viewed the documents.
    # - `completed`: This status is triggered when all recipients have completed their assigned actions on an envelope.
    # - `declined`: This status is triggered when a recipient has declined to sign the envelope.
    # - `voided`: The voided status indicates that the sender has voided the envelope.
    #
    # **Note:** In previous versions of the API, this value was a single comma-separated string.
    string[] envelopeEvents?;
    # This object lets you choose the data format of your Connect response.
    ConnectEventData eventData?;
    # A comma-separated list of envelope-level event statuses that will trigger Connect to send updates to the endpoint specified in the `urlToPublishTo` property.
    #
    # Set this property when you are using the [JSON SIM event model](/platform/webhooks/connect/improved-json-sim-event-model/). If you are instead using any of [the legacy event message formats](/platform/webhooks/connect/legacy-message-formats/), set either the `envelopeEvents` property or the `recipientEvents` property.
    #
    # The [possible event statuses](/platform/webhooks/connect/improved-json-sim-event-model/#eventreference) are:
    #
    # * `envelope-created`
    # * `envelope-sent`
    # * `envelope-resent`
    # * `envelope-delivered`
    # * `envelope-completed`
    # * `envelope-declined`
    # * `envelope-voided`
    # * `recipient-authenticationfailed`
    # * `recipient-autoresponded`
    # * `recipient-declined`
    # * `recipient-delivered`
    # * `recipient-completed`
    # * `recipient-sent`
    # * `recipient-resent`
    # * `template-created`
    # * `template-modified`
    # * `template-deleted`
    # * `envelope-corrected`
    # * `envelope-purge`
    # * `envelope-deleted`
    # * `envelope-discard`
    # * `recipient-reassign`
    # * `recipient-delegate`
    # * `recipient-finish-later`
    # * `click-agreed`
    # * `click-declined`
    string[] events?;
    # The ID of an external folder.
    string externalFolderId?;
    # The label for an external folder.
    string externalFolderLabel?;
    #
    string[] groupIds?;
    # When **true,** the Connect Service includes the Certificate of Completion with completed envelopes. 
    string includeCertificateOfCompletion?;
    # When **true,** a certificate for a SOAP header is included in messages sent through Connect.
    string includeCertSoapHeader?;
    # When **true,** the Document Fields associated with the envelope's documents are included in the notification messages. Document Fields are optional custom name-value pairs added to documents using the API. 
    string includeDocumentFields?;
    # When **true,**
    # Connect attaches the envelope documents
    # to the payloads of your event notification messages.
    #
    # **Note:** Consider resources and scaling when adding documents
    # to your event payloads. Documents attached to these messages
    # are sent as base64 strings,
    # which are larger than binary document data.
    # This can significantly increase your payload size,
    # opening up windows for failure.
    # If you include documents,
    # you must build your application to scale in these situations.
    string includeDocuments?;
    # When **true,** Connect will include the voidedReason for voided envelopes.
    string includeEnvelopeVoidReason?;
    # When **true,** a Hash-based Message Authentication Code (HMAC) signature is included in messages sent through Connect.
    # For more information, see [Using HMAC Security with DocuSign Connect](/platform/webhooks/connect/hmac/).
    string includeHMAC?;
    #
    string includeOAuth?;
    # When **true,** Connect will include the sender account as Custom Field in the data.
    string includeSenderAccountasCustomField?;
    # When **true,** Connect will include the envelope time zone information.
    string includeTimeZoneInformation?;
    #
    string integratorManaged?;
    # The name of the Connect configuration. The name helps identify the configuration in the list.
    string name?;
    # The user's encrypted password hash.
    string password?;
    # An array of strings that lists of recipient-related events that trigger a notification
    # to your webhook Connect listener. The possible event values are:
    #
    # - `sent`: If a recipient type is set to receive an email notification to take action on an envelope, the recipient status is set to `sent` upon delivery of the email.
    # - `delivered`: The recipient has viewed the documents in the envelope. This recipient status does not indicate email delivery of the documents in the envelope.
    # - `completed`: The recipient has completed their assigned actions on an envelope.
    # - `declined`: The recipient has declined to sign a document in the envelope.
    # - `authenticationfailed`: At least one signer has failed the authentication check on the document. If this occurs, you have two options:
    # - Send a reminder to the recipients, which provides the signer with another chance to access and pass the authentication.
    # - Correct the document and modify the authentication setting.
    # - `autoresponded`: The recipient's email system sent back an automatic response. This status is only used when **Send-on-behalf-of** is turned off for the account.
    #
    # **Note:** In previous versions of the API, this value was a single comma-separated string.
    string[] recipientEvents?;
    # When **true,** [Mutual TLS](/platform/webhooks/mutual-tls/) authentication is enabled.
    string requireMutualTls?;
    # When **true,** event delivery acknowledgements are enabled for your Connect configuration.
    #
    # DocuSign Connect awaits a valid 200 response from your application acknowledging that it received a message. If you do not acknowledge receiving an event notification message within 100 seconds, DocuSign treats the message as a failure and places it into a failure queue. It is imperative that you acknowledge successful receipt of Connect events as they occur by sending a 200 event back.
    #
    # #### When **true** and Send Individual Messages (SIM) mode is activated
    #
    # If the HTTP status response to a notification message is not in the range of 200-299,
    # then the message delivery failed, and the configuration is marked as down.
    #
    # The message will be queued and retried once per day.
    # While a Connect configuration is marked down, subsequent notifications will not be tried. Instead they will be immediately queued with the reason `Pending`.
    # When a message succeeds, all queued messages for the configuration will be tried immediately, in order.
    #
    # There is a maximum of ten retries. Alternately, you can use **Republish Connect Information** to manually republish the notification.
    #
    # #### When **true** and SIM mode is not activated
    #
    # If the HTTP Status response to a notification message is not in the range of 200-299,  then the message delivery failed, and the message is queued.
    #
    # The message will be retried after at least a day the next time a subsequent message is successfully sent to this configuration (subscription).  Subsequent notifications will be tried when they occur.
    # There is a maximum of ten retries. Alternately, you can use **Republish Connect Information** to manually republish the notification.
    #
    # #### When **false**
    #
    # When `requiresAcknowledgement` is set to **false** and you do not acknowledge receiving an event notification message within 100 seconds, DocuSign treats the message as a failure and determines that the server is unavailable. It does not retry to send the notification message, and you must handle the failure manually.
    string requiresAcknowledgement?;
    # The version of the Salesforce API that you are using.
    string salesforceApiVersion?;
    #
    string salesforceAuthcode?;
    #
    string salesforceCallBackUrl?;
    # When **true,** DocuSign can use documents in your Salesforce account for sending and signing.
    string salesforceDocumentsAsContentFiles?;
    #
    string senderOverride?;
    # This property sets the items that are available for selection when adding or editing Connect objects. 
    string[] senderSelectableItems?;
    # An array of Salesforce objects.
    ConnectSalesforceObject[] sfObjects?;
    # When **true,** Mutual TLS will be enabled for notifications. Mutual TLS must be initiated by the listener (the customer's web server) during the TLS handshake protocol. 
    string signMessageWithX509Certificate?;
    # The namespace of the SOAP interface.
    #
    # **Note:** If `useSoapInterface` is set to **true,** you must set this value.
    string soapNamespace?;
    # The endpoint to which Connect should send webhook notification messages via an HTTPS POST request. The URL must start with `https`. The customer's web server must use an SSL/TLS certificate whose CA is in the Microsoft list of trusted CAs. Self-signed certificates are not acceptable, but you can use free certificates from Let's Encrypt.
    #
    # The maximum length of this property is 4096 bytes.
    string urlToPublishTo?;
    # A comma-separated list of user IDs. This sets the users associated with the tracked envelope and recipient events. When a tracked event occurs for a set user, the a notification message is sent to your Connect listener.
    #
    # By default, the users will be included in the configuration. If you want to exclude the users, set the `allUsersExcept` property to **true.**
    #
    # **Note:** If `allUsers` is set to `false`, then you must provide a list of user IDs.
    string[] userIds?;
    # The name of the user.
    string userName?;
    # When **true,** indicates that the `urlToPublishTo` property contains a SOAP endpoint.
    string useSoapInterface?;
};

# Represents the type for a login account.
public type LoginAccount record {
    # The account ID associated with the envelope.
    string accountId?;
    # The GUID associated with the account ID.
    string accountIdGuid?;
    # The URL that should be used for successive calls to this account. It includes the protocal (https), the DocuSign server where the account is located, and the account number. Use this Url to make API calls against this account. Many of the API calls provide Uri's that are relative to this baseUrl.
    string baseUrl?;
    # The email address for the user.
    string email?;
    # This value is true if this is the default account for the user, otherwise false is returned.
    string isDefault?;
    # A list of settings on the account that indicate what features are available.
    NameValue[] loginAccountSettings?;
    # A list of user-level settings that indicate what user-specific features are available.
    NameValue[] loginUserSettings?;
    # The name associated with the account.
    string name?;
    # An optional descirption of the site that hosts the account.
    string siteDescription?;
    # The ID of the user to access.
    #
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
    # The name of this user as defined by the account.
    string userName?;
};

# This section provides information about template locks. You use template locks to prevent others from making changes to a template while you are modifying it.
public type TemplateLocks record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The number of seconds until the lock expires when there is no activity on the template.
    #
    # If no value is entered, then the default value of 300 seconds is used. The maximum value is 1,800 seconds.
    #
    # The lock duration can be extended.
    string lockDurationInSeconds?;
    # Specifies the friendly name of  the application that is locking the envelope.
    string lockedByApp?;
    #
    UserInfo lockedByUser?;
    # The date and time that the lock expires.
    string lockedUntilDateTime?;
    # A unique identifier provided to the owner of the lock. You must use this token with subsequent calls to prove ownership of the lock.
    string lockToken?;
    # The type of lock.  Currently `edit` is the only supported type.
    string lockType?;
    # When **true,** a scratchpad is used to edit information.
    #
    string useScratchPad?;
};

# The request body for the [TemplateViews: createEdit](/docs/esign-rest-api/reference/templates/templateviews/createedit/) method.
public type ReturnUrlRequest record {
    # The URL to which the user should be redirected after the editing session is complete. It must be an absolute URL (e.g. `https://www.example.com` not `www.example.com`).
    #
    # The maximum length is 470 characters. If the value exceeds this limit, the user is redirected to a truncated URL.
    #
    # **Note:** If this property is not provided, the user will have full access to the sending account.
    string returnUrl?;
};