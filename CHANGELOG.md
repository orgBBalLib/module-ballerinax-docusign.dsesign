# Change Log

This file contains all the notable changes done to the Ballerina connector through the releases.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New map<string|string[]> headers parameter added to every resource function allowing per-request custom HTTP headers
- New POST /v2.1/accounts/{accountId}/envelopes/{envelopeId}/shares endpoint added
- New PUT /v2.1/accounts/{accountId}/templates endpoint added accepting TemplateAutoMatchList payload
- audit_events GET endpoint now accepts query parameters via *AuditEventsGetAuditEventsQueries
- identity_proof_token POST now accepts query parameters via *RecipientsPostRecipientProofFileResourceTokenQueries
- Default serviceUrl set to https://www.docusign.net/restapi making init() callable with no arguments
- ConnectionConfig now supports additional HTTP client options: laxDataBinding, followRedirects, cookieConfig, socketConfig

### Changed
- init() parameter order reversed: serviceUrl is now second with a default value, config is now first with a default value
- All resource function return types changed from typed Ballerina records to http:Response|error (callers must now deserialise responses themselves)
- All resource function paths prefixed with v2\.1 (e.g. accounts/... becomes v2\.1/accounts/...)
- All individual query parameters replaced with typed spread record *<OperationId>Queries (e.g. string? include_account_settings replaced by *AccountsGetAccountQueries)
- Brand logo PUT payload type changed from byte[] to record {byte[] fileContent; string fileName;}
- View endpoint POST /views/correct payload changed from CorrectViewRequest to EnvelopeViewRequest
- View endpoint POST /views/edit payload changed from ReturnUrlRequest to EnvelopeViewRequest
- View endpoint POST /views/sender payload changed from ReturnUrlRequest to EnvelopeViewRequest
- Consumer disclosure path parameter renamed from languageCode to langCode
- Brand resources PUT payload type renamed from Resources_resourceContentType_body to ResourcesresourceContentTypeBody
- JSON serialisation changed from payload.toJson() to jsondata:toJson(payload) requiring new import ballerina/data.jsondata
- Multipart body construction changed to use jsondata:toJson(payload).ensureType()

### Fixed
- Simplified HTTP client initialization removing error-prone ensureType checks for each config field
