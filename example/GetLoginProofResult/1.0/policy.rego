package example.GetLoginProofResult

import future.keywords.if

# claims := ocm.getLoginProofResult(input.requestId)
claims := {
    "Vorname": "Test",
    "Nachname": "Test",
    "Organisation": "Some Orga",
    "Role": "OrgLegRep",
    "ID": "Test",
    "subjectDID": "1234",
    "iss": "did:web:marketplace.dev.merlot-education.eu#df15587a-0760-32b5-9c42-bb7be66e8076",
    "sub": "1234",
    "auth_time": "1234"
}

resolvedOrgaMeta := http.send({"method": "get", "url": concat("", ["https://api.dev.merlot-education.eu/organisations/organization/", replace(claims.iss, "#", "%23")]), "force_json_decode": true}).body.metadata

inactiveCheck if {
	# check if not active
	resolvedOrgaMeta.active != true

	# cause an error
	ocm.getLoginProofResult("garbage")
}

invalidFederatorCheck if {
	# check if role is FedAdmin but organisation is not federator
	claims.Role == "FedAdmin"
	resolvedOrgaMeta.membershipClass != "FEDERATOR"

	# cause an error
	ocm.getLoginProofResult("garbage")
}

Vorname := getName(claims)
Nachname = getFamilyName(claims)
Organisation = getOrga(claims)
Role = getRole(claims)
ID = getID(claims)
subjectDID = getSubjectDid(claims)
issuerDID = getissuerDID(claims)
iss = getIss(claims)
sub = getSub(claims)
auth_time = getAuth_time(claims)


getName(c) = x {
	x = c.Vorname
}
getFamilyName(c) = x {
	x = c.Nachname
}
getOrga(c) = x {
	x = c.Organisation
}
getRole(c) = x {
	x = c.Role
}
getID(c) = x {
	x = c.ID
}
getSubjectDid(c) = x {
	x = c.subjectDID
}
getissuerDID(c) = x {
	x = c.issuerDID
}
getIss(c) = x {
	x = c.iss
}
getSub(c) = x {
	x = c.sub
}
getAuth_time(c) = x {
	x = c.auth_time
}