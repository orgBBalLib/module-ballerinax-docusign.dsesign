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

# Represents the result of a failed attempt to delete a connection.
public type ConnectDeleteFailureResult record {
};

# This resource is used to create a responsive preview of a specific template document.
public type TemplateDocumentResponsiveHtmlPreview record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# Represents the status and identifier of a user's authorization, including any associated error messages.
public type UserAuthorizationIdWithStatus record {
    # The unique identifier for the user authorization.
    string authorizationId?;
    # The error message related to the user authorization process, if any.
    string errorMessage?;
    # Indicates the success status of the user authorization.
    string success?;
};

# Defines the structure for HTML definitions associated with a template, which are used to generate responsive HTML formatting for documents within the template.
public type TemplateHtmlDefinitions record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# This object contains information about a seat discount.
public type SeatDiscount record {
    # Reserved for DocuSign.
    string beginSeatCount?;
    # The percent of the discount. 
    #
    # Example: `"0.00"`
    string discountPercent?;
    # Reserved for DocuSign.
    string endSeatCount?;
};

# This object contains the data that recipients have entered into the form fields associated with an envelope.
public type EnvelopeFormData record {
    # The subject line of the email message that is sent to all recipients.
    #
    # For information about adding merge field information to the email subject, see [Template Email Subject Merge Fields](/docs/esign-rest-api/reference/templates/templates/create/#template-email-subject-merge-fields).
    #
    # **Note:** The subject line is limited to 100 characters, including any merged fields.It is not truncated. It is an error if the text is longer than 100 characters.
    string emailSubject?;
    # The ID of the envelope.
    string envelopeId?;
    # An array of form data objects.
    FormDataItem[] formData?;
    #
    PrefillFormData prefillFormData?;
    # An array of form data objects that are associated with specific recipients.
    RecipientFormData[] recipientFormData?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
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
};

# Represents a record of a notarial act, capturing details about the notarization process, the document, and the signer.
public type NotaryJournal record {
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    # The name of the document.
    string documentName?;
    # Describes the jurisdiction of a notary.
    # This is read-only object.
    Jurisdiction jurisdiction?;
    # A unique GUID for this journal entry.
    string notaryJournalId?;
    # Metadata associated with the notary journal entry.
    NotaryJournalMetaData notaryJournalMetaData?;
    # The in-person signer's full legal name.
    #
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `name` instead.
    #
    # Maximum Length: 100 characters.
    string signerName?;
};

# Contains information related to a user's password, including the current password, the new password, and any associated security questions for password recovery.
public type UserPasswordInformation record {
    # The user's current password to be changed.
    string currentPassword?;
    # The user's email address for the associated account.
    string email?;
    # A complex element that has up to four Question/Answer pairs for forgotten password information.
    ForgottenPasswordInformation forgottenPasswordInfo?;
    # The user's new password.
    string newPassword?;
};

# Contains information about an APP store product.
public type AppStoreProduct record {
    #
    string marketPlace?;
    # The Product ID from the AppStore.
    string productId?;
};

# Summarizes the status of a bulk envelope operation, including identifiers, counts, and navigation URIs for batch processing.
public type BulkEnvelopeStatus record {
    # Specifies an identifier which can be used to retrieve a more detailed status of individual bulk recipient batches.
    string batchId?;
    # The number of items returned in this response.
    string batchSize?;
    # A list of bulk envelope objects.
    BulkEnvelope[] bulkEnvelopes?;
    # URI at which you can retrieve the batch envelopes.
    string bulkEnvelopesBatchUri?;
    # The last index position in the result set.
    string endPosition?;
    # The number of entries with a status of failed.
    string failed?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search.
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search.
    string previousUri?;
    # The number of entries with a status of queued.
    string queued?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The number of entries with a status of sent.
    string sent?;
    # The starting index position of the current result set.
    string startPosition?;
    # The date on which the bulk envelope was created.
    string submittedDate?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# Represents the result of a query for envelope attachments, encapsulating the list of attachments.
public type EnvelopeAttachmentsResult record {
    # An array of attachment objects that contain information about the attachments.
    EnvelopeAttachment[] attachments?;
};

# Contains a list of file types, typically used to specify supported file formats or to enumerate files of certain types.
public type FileTypeList record {
    # A collection of file types.
    FileType[] fileTypes?;
};

# A single bulk send error report.
public type BulkSendErrorStatus record {
    # The timestamp of when the error occurred in ISO 8601 format.
    string created?;
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # The error message generated during processing, if any.
    string errorMessage?;
    # An array of email addresses for the failed bulk envelope.
    #
    # Recipient email/info of the failed bulk envelope.
    string[] recipientEmails?;
};

# This object contains the results of a ConnectConfigurations::GET method.
public type ConnectConfigResults record {
    # An array of DocuSign Connect configurations.
    ConnectCustomConfiguration[] configurations?;
    # The number of results.
    string totalRecords?;
};

# Connect event logging information. This object contains sections for regular Connect logs and for Connect failures. 
public type ConnectEvents record {
    # A list of Connect failure logs.
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

# Represents the resource token for an identity evidence, providing the base URI and the specific token for accessing the identity verification resource.
public type IdEvidenceResourceToken record {
    # The base URI for the identity proofing resource.
    string proofBaseURI?;
    # The specific token required to access the identity verification resource.
    string resourceToken?;
};

# Contains the form data submitted by a recipient, including timestamps of key events and the recipient's information.
public type RecipientFormData record {
    # The date and time the recipient declined the envelope.
    string DeclinedTime?;
    # The date and time the recipient viewed the documents in the envelope in the DocuSign signing UI.
    string DeliveredTime?;
    # The recipient's email address.
    string email?;
    # An array of form data objects representing the data submitted by the recipient.
    FormDataItem[] formData?;
    # The name of the recipient.
    string name?;
    # Unique identifier for the recipient. It is used by the tab element to indicate which recipient is to sign the document.
    string recipientId?;
    # The date and time the envelope was sent to the recipient.
    string SentTime?;
    # The date and time the recipient signed the documents.
    string SignedTime?;
};

# Defines the structure for HTML definitions associated with a document, which are used to generate responsive HTML formatting for the document's content.
public type DocumentHtmlDefinitions record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# Represents a discount applied to a billing plan, detailing the quantity range for the discount and the discount value.
public type BillingDiscount record {
    # The starting quantity from which the discount applies.
    string beginQuantity?;
    # The discount amount or percentage applied.
    string discount?;
    # The ending quantity up to which the discount applies.
    string endQuantity?;
};

# Represents the result of a query for documents within an envelope, including an array of documents and the envelope ID.
public type EnvelopeDocumentsResult record {
    # An array containing information about the documents included in the envelope.
    EnvelopeDocument[] envelopeDocuments?;
    # The unique identifier of the envelope.
    string envelopeId?;
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
public type EnvelopeDocumentVisibility record {
    # An array of `documentVisibility` objects that specifies which documents are visible to which recipients.
    DocumentVisibility[] documentVisibility?;
};

# Document Generation for eSignature allows you to
# dynamically generate
# documents from a Word template to send for
# signature within the eSignature sending workflow.
public type DocumentGeneration record {
    #
    DocGenFormFields[] docGenFormFields?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
};

# A TemplateView contains a URL that you can embed in your application to generate a template view that uses the DocuSign user interface (UI).
public type TemplateViews record {
    # The URL that you navigate to in order to start the view.
    string url?;
};

# Contains the original HTML definitions for a document, which are used to generate responsive-formatted HTML.
public type DocumentHtmlDefinitionOriginals record {
    # An array of original HTML definition objects.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# This resource provides methods that enable account administrators to create and manage envelope transfer rules.
public type EnvelopeTransferRules record {
    # The last index position in the result set. 
    string endPosition?;
    # Contains information about a specific envelope transfer rule.
    EnvelopeTransferRule[] envelopeTransferRules?;
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

public type Resources_resourceContentType_body record {
    # Brand resource XML file.
    record {byte[] fileContent; string fileName;} file\.xml;
};

# Represents a collection of favorite templates for a user or account, including any associated error details and update counts.
public type FavoriteTemplates record {
    # Details about any errors that occur, applicable only in responses.
    ErrorDetails errorDetails?;
    # An array of content items representing the favorite templates.
    FavoriteTemplatesContentItem[] favoriteTemplates?;
    # The count of templates successfully updated, which is a read-only property.
    int:Signed32 templatesUpdatedCount?;
};

# This resource is used to create a responsive preview of all of the documents in an envelope.
public type ResponsiveHtmlPreview record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# Encapsulates the response data for a user search operation, including pagination details and a list of user information.
public type UsersResponse record {
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

# Contains configuration settings for eNote integration, including API keys, user credentials, and organizational details.
public type ENoteConfigurations record {
    #
    string apiKey?;
    #
    string connectConfigured?;
    #
    string eNoteConfigured?;
    #
    string organization?;
    # The user's encrypted password hash.
    string password?;
    # The name of the user.
    string userName?;
};

# Represents the essential information of a user for connection purposes, including their email, inclusion status, user ID, and name.
public type ConnectUserInfo record {
    # The email address of the user.
    string email?;
    # Indicates whether the user is included in a specific operation or group.
    string isIncluded?;
    # The unique identifier of the user. Users can only access their own information.
    string userId?;
    # The full name of the user.
    string userName?;
};

# Contains information about a billing invoice.
public type BillingInvoice record {
    # The total amount of the purchase.
    string amount?;
    # Reserved for DocuSign.
    string balance?;
    # Reserved for DocuSign.
    string dueDate?;
    # Reserved for DocuSign.
    string invoiceId?;
    # Reserved for DocuSign.
    BillingInvoiceItem[] invoiceItems?;
    # Reserved for DocuSign.
    string invoiceNumber?;
    # Contains a URI for an endpoint that you can use to retrieve invoice information.
    string invoiceUri?;
    #
    string nonTaxableAmount?;
    #
    string pdfAvailable?;
    #
    string taxableAmount?;
};

# Represents the pricing details of a currency plan, including currency code, symbol, and various fees associated with the plan.
public type CurrencyPlanPrice record {
    # Specifies the ISO 4217 currency code for the account.
    string currencyCode?;
    # Specifies the currency symbol associated with the currency code.
    string currencySymbol?;
    # The per-seat price associated with the plan, formatted as a string.
    string perSeatPrice?;
    # Supported credit card types for the plan.
    CreditCardTypes supportedCardTypes?;
    # The support incident fee charged for each support incident, formatted as a string.
    string supportIncidentFee?;
    # The support plan fee charged for this plan, formatted as a string.
    string supportPlanFee?;
};

# This object contains basic information about a bulk send list.
public type BulkSendingListSummary record {
    # The GUID of the bulk send list. This property is created after you post a new bulk send list.
    string bulkSendListId?;
    # The GUID of the user who created the bulk send list.
    string createdByUser?;
    # The UTC DateTime that the bulk send list was created.
    string createdDate?;
    # The name of the bulk send list.
    string name?;
};

# Contains information about the service, including build details and versioning, primarily for internal use by DocuSign.
public type ServiceInformation record {
    # Reserved for DocuSign to specify the build branch.
    string buildBranch?;
    # Reserved for DocuSign to specify the deployment date and time of the build branch.
    string buildBranchDeployedDateTime?;
    # Reserved for DocuSign to specify the build's SHA (hash).
    string buildSHA?;
    # Reserved for DocuSign to specify the build version.
    string buildVersion?;
    # An array of linked sites related to the service.
    string[] linkedSites?;
    # An array of service version details.
    ServiceVersion[] serviceVersions?;
};

# Defines a billing payment request object.
public type BillingPaymentItem record {
    # The total amount of the purchase.
    string amount?;
    # A sender-defined description of the line item.
    string description?;
    #
    string paymentDate?;
    # The ID of the payment.
    string paymentId?;
    # When **true,** a PDF version of the invoice is available. 
    #
    # To get the PDF, make the call again and change "Accept:" in the header to "Accept: application/pdf".
    string paymentNumber?;
};