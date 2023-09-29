// Contains the JavaScript code to display information about a persona
function logMessage(message) {
    var updatedHtml = document.getElementById('Messages').innerHTML + message + '<br>';
    document.getElementById('Messages').innerHTML = updatedHtml;
}

function ReportError(method, details) {
  var errorMessage = 'Error in : ' + method + ' : ' + details.toString() + '<br>';

  var updatedHtml = document.getElementById('Errors').innerHTML + errorMessage;
  document.getElementById('Errors').innerHTML = updatedHtml;
}

function BuildIndentStyle(depth) {
  var indent = depth * 20;
  return 'style="margin-left: ' + indent + 'px"';
}

function BeginObject(personaHtml, name, depth) {
  personaHtml = personaHtml + '<div ' + BuildIndentStyle(depth) + '><B>' + name + '</B><br>';
  return personaHtml;
}

function AddField(personaHtml, name, value, source, optionalHtml) {
  if (value != undefined && (value != '' || typeof value == 'boolean')) {
    personaHtml = personaHtml + name + ': ' + value;
    if (source != undefined) {
      if (source != '') {
        personaHtml = personaHtml + ' (' + source + ')';
      }
    }

    if (optionalHtml != undefined) {
      if (optionalHtml != '') {
        personaHtml = personaHtml + optionalHtml;
      }
    }

    personaHtml = personaHtml + '<br>';
  }

  return personaHtml;
}

function ArrayToStringList(values, addAction, actionName, actionMethod) {
  var valueList = '';
  if (values != undefined) {
    var index = 0;
    for (index = 0; index < values.length; index++) {
      if (index > 0) {
        valueList = valueList + ', ';
      }

      valueList = valueList + values[index];
      if (addAction != undefined) {
        valueList = valueList + BuildConditionalActionHtml(addAction, actionName, actionMethod, values[index]);
      }
    }
  }

  return valueList;
}

function AddFieldArray(personaHtml, name, values, sources, addAction, actionName, actionMethod) {
  return AddField(
    personaHtml,
    name,
    ArrayToStringList(values, addAction, actionName, actionMethod),
    ArrayToStringList(sources)
  );
}

function EndObject(personaHtml) {
  personaHtml += '</div>';
  return personaHtml;
}

function PhonesToStringList(values, canCallPhoneNumber) {
  var valueList = '';
  var index = 0;
  for (index = 0; index < values.length; index++) {
    if (index > 0) {
      valueList = valueList + ', ';
    }

    valueList =
      valueList +
      values[index].number +
      ' [' +
      values[index].type +
      ']' +
      BuildConditionalActionHtml(canCallPhoneNumber, 'Call', 'InvokeCallPhoneNumber', values[index].number);
  }

  return valueList;
}

function AddPhones(personaHtml, phones, phonesSources, canCallPhoneNumber) {
  if (phones != undefined) {
    if (phones.length > 0) {
      personaHtml = AddField(
        personaHtml,
        'Phones',
        PhonesToStringList(phones, canCallPhoneNumber),
        ArrayToStringList(phonesSources)
      );
    }
  }

  return personaHtml;
}

function AddressesToStringList(values) {
  var valueList = '';
  var index = 0;
  for (index = 0; index < values.length; index++) {
    if (index > 0) {
      valueList = valueList + ', ';
    }

    valueList =
      valueList +
      '{street} ' +
      values[index].street +
      ' {city} ' +
      values[index].city +
      ' {state} ' +
      values[index].state +
      ' {postal code} ' +
      values[index].postalCode +
      ' {country} ' +
      values[index].country +
      ' {address} ' +
      values[index].address +
      ' [' +
      values[index].type +
      ']';
  }

  return valueList;
}

function AddAddresses(personaHtml, addresses, addressSources) {
  if (addresses != undefined) {
    if (addresses.length > 0) {
      personaHtml = AddField(
        personaHtml,
        'Addresses',
        AddressesToStringList(addresses),
        ArrayToStringList(addressSources)
      );
    }
  }

  return personaHtml;
}

function AddCustomizations(personaHtml, customizations) {
  if (customizations != undefined) {
    for (var index = 0; index < customizations.length; index++) {
      personaHtml =
        personaHtml +
        customizations[index].field +
        ' {label} ' +
        customizations[index].label +
        ' {value} ' +
        customizations[index].value +
        '<br>';
    }
  }

  return personaHtml;
}

function AddContactSources(personaHtml, contactSources) {
  if (contactSources != undefined) {
    if (contactSources.length > 0) {
      personaHtml = BeginObject(personaHtml, 'Contacts', 2);
      for (var index = 0; index < contactSources.length; index++) {
        var action = BuildConditionalActionHtml(
          'true',
          'Edit',
          'InvokeEditContactByIdentifier',
          contactSources[index].identifier
        );
        personaHtml =
          personaHtml + contactSources[index].label + ' : ' + contactSources[index].identifier + action + '<br>';
      }
      personaHtml = EndObject(personaHtml);
    }
  }

  return personaHtml;
}

function AddUrlBasedSources(personaHtml, urlBasedSources) {
  if (urlBasedSources != undefined) {
    if (urlBasedSources.length > 0) {
      personaHtml = BeginObject(personaHtml, 'Urls', 2);
      for (var index = 0; index < urlBasedSources.length; index++) {
        personaHtml = personaHtml + urlBasedSources[index].label + ' : ' + urlBasedSources[index].url + '<br>';
      }
      personaHtml = EndObject(personaHtml);
    }
  }

  return personaHtml;
}

function AddImage(personaHtml, imageUri) {
  if (imageUri != undefined) {
    personaHtml = personaHtml + '<img src="' + imageUri + '" /><br>';
  }

  return personaHtml;
}

function AddPersonaSummary(personaHtml, persona, personaInfo, photoUri) {
  if (persona != undefined && personaInfo != undefined) {
    personaHtml =
      personaHtml +
      '{HostId:' +
      persona.hostId +
      '} ' +
      personaInfo.displayName +
      ', ' +
      personaInfo.email +
      ', ' +
      personaInfo.title +
      '<br>';

    if (photoUri != undefined) {
      personaHtml = AddImage(personaHtml, photoUri);
    }
  }

  return personaHtml;
}

function AddMemberItems(personaHtml, items) {
  if (items != undefined) {
    if (items.length > 0) {
      for (var index = 0; index < items.length; ++index) {
        var current = items[index];
        personaHtml =
          personaHtml +
          '{' +
          current.type +
          '} ' +
          current.name +
          ', ' +
          current.email +
          ', ' +
          current.title +
          ', ' +
          current.personaCookie +
          ', ' +
          current.isOwner +
          '<br>';
      }
    }
  }

  return personaHtml;
}

function renderViewableSources(persona) {
  persona.getViewableSources().then(
    function(value) {
      var personaHtml = '';
      personaHtml = BeginObject(personaHtml, 'Viewable Sources', 1);
      personaHtml = AddContactSources(personaHtml, value.contactSources);
      personaHtml = AddUrlBasedSources(personaHtml, value.urlBasedSources);
      personaHtml = EndObject(personaHtml);

      document.getElementById('ViewableSources').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('getViewableSources', detail);
    }
  );
}

function renderCustomizations(persona) {
  persona.getCustomizations().then(
    function(values) {
      var personaHtml = '';
      personaHtml = BeginObject(personaHtml, 'Customization', 1);
      personaHtml = AddCustomizations(personaHtml, values);
      personaHtml = EndObject(personaHtml);

      document.getElementById('Customizations').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('renderCustomizations', detail);
    }
  );
}

// Loads and renders membership informaiton
function renderMemberships(persona) {
  persona.getMembership().then(
    function(membership) {
      membership.retrieve({ $all: true }).then(
        function(value) {
          membership.items().then(
            function(membershipItems) {
              var personaHtml = '';
              personaHtml = BeginObject(personaHtml, 'Membership', 1);
              personaHtml = AddField(personaHtml, 'IsWarmedUp', value.isWarmedUp);
              personaHtml = AddField(personaHtml, 'IsWarmingUp', value.isWarmingUp);
              personaHtml = AddMemberItems(personaHtml, membershipItems);
              personaHtml = EndObject(personaHtml);

              document.getElementById('Membership').innerHTML = personaHtml;
            },
            function(detail) {
              ReportError('renderMemberships(items)', detail);
            }
          );
        },
        function(detail) {
          ReportError('renderMemberships(retrieve)', detail);
        }
      );
    },
    function(detail) {
      ReportError('renderMemberships(getMembership)', detail);
    }
  );
}

// Loads and renders members informaiton
function renderMembers(persona) {
  persona.getMembers().then(
    function(members) {
      members.retrieve({ $all: true }).then(
        function(value) {
          members.items().then(
            function(memberItems) {
              var personaHtml = '';
              personaHtml = BeginObject(personaHtml, 'Members', 1);
              personaHtml = AddField(personaHtml, 'IsWarmedUp', value.isWarmedUp);
              personaHtml = AddField(personaHtml, 'IsWarmingUp', value.isWarmingUp);
              personaHtml = AddMemberItems(personaHtml, memberItems);
              personaHtml = EndObject(personaHtml);

              document.getElementById('Members').innerHTML = personaHtml;
            },
            function(detail) {
              ReportError('renderMembers(items)', detail);
            }
          );
        },
        function(detail) {
          ReportError('renderMembers(retrieve)', detail);
        }
      );
    },
    function(detail) {
      ReportError('renderMembers(getMembers)', detail);
    }
  );
}

function ShowHoverCard(persona, top, left, width, height) {
  persona.actions.showHoverCardForPersona(left, top, top, left, width, height).then(function() {});
}

function HideHoverCard(persona, top, left, width, height) {
  persona.actions.hideHoverCardForPersona().then(function() {});
}

function ShowContextMenu(persona, top, left, width, height) {
  persona.actions.showContextMenu(left, top, top, left, width, height).then(function() {});
}

function ShowContactCard(persona, top, left, width, height) {
  persona.actions.showContactCard(left, top, top, left, width, height).then(function() {});
}

function ShowExpandedViewCard(persona, top, left, width, height) {
  persona.actions.showExpandedCard(left, top, top, left, width, height).then(function() {});
}

function CallShowCardFunc(personaHostId, showCardFunction, elementId) {
  var top = 0;
  var left = 0;
  var width = 0;
  var height = 0;
  var element = document.getElementById(elementId);
  if (element != undefined) {
    top = element.offsetTop - window.pageYOffset;
    left = element.offsetLeft - window.pageXOffset;
    width = element.offsetWidth;
    height = element.offsetHeight;
  }

  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getPersonaLifetime().then(function(lifetime) {
    lifetime.getPersona(personaHostId).then(function(persona) {
      showCardFunction(persona, top, left, width, height);
    });
  });
}

// Adds the buttons for showing the various contact cards
function AddShowCardCommands(personaHtml, personaHostId) {
  var hoverId = 'HoverButton_' + personaHostId;
  var hideId = 'HideButton_' + personaHostId;
  var menuId = 'MenuButton_' + personaHostId;
  var cardId = 'CardButton_' + personaHostId;
  var expandedViewId = 'ExpandedViewButton_' + personaHostId;

  personaHtml =
    personaHtml +
    "<button id='" +
    hoverId +
    "' onclick=\"CallShowCardFunc('" +
    personaHostId +
    "', ShowHoverCard, '" +
    hoverId +
    '\');">Hover</button>' +
    " <button id='" +
    hideId +
    "' onclick=\"CallShowCardFunc('" +
    personaHostId +
    "', HideHoverCard, '" +
    hideId +
    '\');">Hide</button>' +
    " <button id='" +
    menuId +
    "' onclick=\"CallShowCardFunc('" +
    personaHostId +
    "', ShowContextMenu, '" +
    menuId +
    '\');">Menu</button>' +
    " <button id='" +
    cardId +
    "' onclick=\"CallShowCardFunc('" +
    personaHostId +
    "', ShowContactCard, '" +
    cardId +
    '\');">Card</button>' +
    " <button id='" +
    expandedViewId +
    "' onclick=\"CallShowCardFunc('" +
    personaHostId +
    "', ShowExpandedViewCard, '" +
    expandedViewId +
    '\');">Expanded</button>';

  return personaHtml;
}

// For personas within the organization we add divs that include the persona hostId, this method
// will determine if a div for the specified persona exists and if so it will load and then render
// the persona summary information into that div.
function renderPersonaSummary(personaHostId) {
  var personaDivName = 'PersonaSummary_' + personaHostId;
  if (document.getElementById(personaDivName) != undefined) {
    // There is a place to render the summary
    var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
    peopleContext.getPersonaLifetime().then(
      function(lifetime) {
        lifetime.getPersona(personaHostId).then(
          function(persona) {
            persona.retrieve({ hostId: true }).then(
              function(personaValue) {
                persona.personaInfo.retrieve({ displayName: true, email: true, title: true }).then(
                  function(infoValue) {
                    persona.photo.getImageUri().then(
                      function(photoUri) {
                        var personaHtml = '';
                        personaHtml = AddPersonaSummary(personaHtml, personaValue, infoValue, photoUri);
                        personaHtml = AddShowCardCommands(personaHtml, personaHostId);

                        var element = document.getElementById(personaDivName);
                        element.innerHTML = personaHtml;
                      },
                      function(detail) {
                        ReportError('renderPersonaSummary(photo.retrieve)', detail);
                      }
                    );
                  },
                  function(detail) {
                    ReportError('renderPersonaSummary(personaInfo.retrieve)', detail);
                  }
                );
              },
              function(detail) {
                ReportError('renderPersonaSummary(persona.retrieve)', detail);
              }
            );
          },
          function(detail) {
            ReportError('renderPersonaSummary(getPersona)', detail);
          }
        );
      },
      function(detail) {
        ReportError('renderPersonaSummary(getPersonaLifetime)', detail);
      }
    );
  }
}

function AddPersonaSummaryDiv(personaHtml, personaHostId, depth) {
  personaHtml = personaHtml + '<div id="PersonaSummary_' + personaHostId + '" ' + BuildIndentStyle(depth) + ' ></div>';
  return personaHtml;
}

// Loads the organization and renders the values
function renderOrganization(persona) {
  var options = {
    $all: true,
    manager: {
      hostId: true
    }
  };

  var ids = [];

  persona.organization.retrieve(options).then(
    function(value) {
      var orgOptions = { hostId: true };
      persona.organization.hierarchy.retrieve(orgOptions).then(
        function(managers) {
          persona.organization.directReports.retrieve(orgOptions).then(
            function(reports) {
              var personaHtml = '';
              personaHtml = BeginObject(personaHtml, 'Organization', 1);
              personaHtml = AddField(personaHtml, 'IsWarmedUp', value.isWarmedUp);
              personaHtml = AddField(personaHtml, 'IsWarmingUp', value.isWarmingUp);
              personaHtml = BeginObject(personaHtml, 'Manager', 2);
              personaHtml = AddPersonaSummaryDiv(personaHtml, value.manager.hostId, 2);
              ids.push(value.manager.hostId); // render the persona summary for the manager

              personaHtml = EndObject(personaHtml);

              if (managers != undefined) {
                if (managers.length > 0) {
                  personaHtml = BeginObject(personaHtml, 'Hierarchy', 2);
                  for (var index = 0; index < managers.length; ++index) {
                    personaHtml = AddPersonaSummaryDiv(personaHtml, managers[index].hostId, 2);
                    ids.push(managers[index].hostId); // render the persona summary for the manager
                  }
                  personaHtml = EndObject(personaHtml);
                }
              }

              if (reports != undefined) {
                if (reports.length > 0) {
                  personaHtml = BeginObject(personaHtml, 'Direct Reports', 2);
                  for (var index = 0; index < reports.length; ++index) {
                    personaHtml = AddPersonaSummaryDiv(personaHtml, reports[index].hostId, 2);
                    ids.push(reports[index].hostId); // render the persona summary for the manager
                  }
                  personaHtml = EndObject(personaHtml);
                }
              }

              personaHtml = EndObject(personaHtml);

              document.getElementById('Organization').innerHTML = personaHtml;

              // Now render the individual persona summaries for the organization members
              if (ids.length > 0) {
                for (var index = 0; index < ids.length; ++index) {
                  renderPersonaSummary(ids[index]);
                }
              }
            },
            function(detail) {
              ReportError('renderOrganization(organization.directReports)', detail);
            }
          );
        },
        function(detail) {
          ReportError('renderOrganization(organization.hierarchy)', detail);
        }
      );
    },
    function(detail) {
      ReportError('renderOrganization(organization.retrieve)', detail);
    }
  );
}

// loads and then renders the unified group information
function renderUnifiedCommunicationInfo(persona) {
  persona.unifiedCommunicationInfo.retrieve({ $all: true }).then(
    function(value) {
      var personaHtml = '';

      personaHtml = BeginObject(personaHtml, 'Unified Communication', 1);
      personaHtml = AddField(personaHtml, 'Availability', value.availability);
      personaHtml = AddField(personaHtml, 'Status', value.status);
      personaHtml = AddField(personaHtml, 'IsSelf', value.isSelf);
      personaHtml = AddField(personaHtml, 'IsTagged', value.isTagged);
      personaHtml = AddField(personaHtml, 'CustomStatusString', value.customStatusString);
      personaHtml = AddField(personaHtml, 'IsBlocked', value.isBlocked);
      personaHtml = AddField(personaHtml, 'PresenceTooltip', value.presenceTooltip);
      personaHtml = AddField(personaHtml, 'IsOutOfOffice', value.isOutOfOffice);
      personaHtml = AddField(personaHtml, 'OutOfOfficeNote', value.outOfOfficeNote);
      personaHtml = AddField(personaHtml, 'Timezone', value.timezone);
      personaHtml = AddField(personaHtml, 'MeetingLocation', value.meetingLocation);
      personaHtml = AddField(personaHtml, 'MeetingSubject', value.meetingSubject);
      personaHtml = AddField(personaHtml, 'TimezoneBias', value.timezoneBias);
      personaHtml = AddField(personaHtml, 'IdleStartTime', value.idleStartTime);
      personaHtml = AddField(personaHtml, 'OverallCapability', value.overallCapability);
      personaHtml = AddField(personaHtml, 'IsOnBuddyList', value.isOnBuddyList);
      personaHtml = AddField(personaHtml, 'PresenceNote', value.presenceNote);
      personaHtml = AddField(personaHtml, 'VoiceMailUri', value.voiceMailUri);
      personaHtml = AddField(personaHtml, 'AvailabilityText', value.availabilityText);
      personaHtml = AddField(personaHtml, 'AvailabilityTooltip', value.availabilityTooltip);
      personaHtml = AddField(personaHtml, 'IsDurationInAvailabilityText', value.isDurationInAvailabilityText);
      personaHtml = AddField(personaHtml, 'FreeBusyStatus', value.freeBusyStatus);
      personaHtml = AddField(personaHtml, 'CalendarState', value.calendarState);
      personaHtml = AddField(personaHtml, 'Presence', value.presence);
      personaHtml = EndObject(personaHtml);

      document.getElementById('UnifiedCommunicationInfo').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('renderUnifiedCommunicationInfo', detail);
    }
  );
}

// loads and then renders the unified communication bucker
function renderUnifiedGroupInfo(persona) {
  persona.unifiedGroupInfo.retrieve({ $all: true }).then(
    function(value) {
      var personaHtml = '';

      personaHtml = BeginObject(personaHtml, 'Unified Group', 1);
      personaHtml = AddField(personaHtml, 'Description', value.description);
      personaHtml = AddField(personaHtml, 'OneDrive', value.oneDrive);
      personaHtml = AddField(personaHtml, 'OneNote', value.oneNote);
      personaHtml = AddField(personaHtml, 'IsPublic', value.isPublic);
      personaHtml = AddField(personaHtml, 'AmIOwner', value.amIOwner);
      personaHtml = AddField(personaHtml, 'AmIMember', value.amIMember);
      personaHtml = AddField(personaHtml, 'AmISubscribed', value.amISubscribed);
      personaHtml = AddField(personaHtml, 'MemberCount', value.memberCount);
      personaHtml = AddField(personaHtml, 'OwnerCount', value.ownerCount);
      personaHtml = AddField(personaHtml, 'HasGuests', value.hasGuests);
      personaHtml = AddField(personaHtml, 'Site', value.site);
      personaHtml = AddField(personaHtml, 'Planner', value.planner);
      personaHtml = AddField(personaHtml, 'Classification', value.classification);
      personaHtml = AddField(personaHtml, 'SubscriptionEnabled', value.subscriptionEnabled);
      personaHtml = EndObject(personaHtml);

      document.getElementById('UnifiedGroupInfo').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('renderUnifiedGroupInfo', detail);
    }
  );
}

// Load and render the photo
function renderPhoto(persona) {
  persona.photo.getImageUri().then(
    function(base64photo) {
	  persona.photo.getPlaceholderUri().then(
  	    function(base64Placeholder){
          persona.photo.getImageUri('ms-app-stream').then(
            function(photoUri) {
              if (photoUri.length > 128) {
                // ms-app-support is still pending, to avoid showing all the base 64 data we trim after 256 characters once
                // we have the ms-app-support this should be able to be removed.
                photoUri = photoUri.substring(0, 128) + '...';
             }

              var personaHtml = '';
              personaHtml = BeginObject(personaHtml, 'Photo', 1);
              personaHtml = AddImage(personaHtml, base64photo);
              personaHtml = BeginObject(personaHtml, 'Placeholder', 1);
              personaHtml = AddImage(personaHtml, base64Placeholder);
              personaHtml = AddField(personaHtml, 'Photo Uri', photoUri);
              personaHtml = EndObject(personaHtml);

              document.getElementById('Photo').innerHTML = personaHtml;
            },
            function(detail) {
              ReportError('renderPhoto getImageUri(ms-app-stream)', detail);
            }
          );
        },
        function(detail) {
          ReportError('renderPhoto getPlaceholderUri', detail);
        }
      );
    },
    function(detail) {
      ReportError('renderPhoto getImageUri', detail);
    }
  );
}

// Renders the persona information
function renderPersonaInfo(persona) {
  persona.personaInfo.retrieve({ $all: true, sources: { $all: true } }).then(
    function(value) {
      persona.personaInfo.getPhones().then(
        function(phones) {
          persona.personaInfo.getAddresses().then(
            function(addresses) {
              persona.retrieve({ capabilities: true }).then(
                function(capabilitesValue) {
                  var canComposeInstantMessage = capabilitesValue.capabilities.canComposeInstantMessage;
                  var canCallPhoneNumber = capabilitesValue.capabilities.canCallPhoneNumber;

                  var personaHtml = '';

                  personaHtml = BeginObject(personaHtml, 'Persona Info', 1);
                  personaHtml = AddField(personaHtml, 'IsResolved', value.isPersonResolved);
                  personaHtml = AddField(personaHtml, 'Name', value.displayName, value.sources.displayName);
                  personaHtml = AddField(
                    personaHtml,
                    'Email',
                    value.email,
                    value.sources.email,
                    BuildConditionalActionHtml(true, 'Email', 'InvokeComposeEmail', value.email)
                  );
                  personaHtml = AddFieldArray(
                    personaHtml,
                    'Email Addresses',
                    value.emailAddresses,
                    value.sources.emailAddresses,
                    true,
                    'Email',
                    'InvokeComposeEmail'
                  );
                  personaHtml = AddFieldArray(
                    personaHtml,
                    'SIP Addresses',
                    value.sipAddresses,
                    value.sources.sipAddresses,
                    canComposeInstantMessage,
                    'IM',
                    'InvokeComposeInstantMessage'
                  );
                  personaHtml = AddField(personaHtml, 'Birthday', value.birthday, value.sources.birthday);
                  personaHtml = AddFieldArray(personaHtml, 'Birthdays', value.birthdays, value.sources.birthdays);
                  personaHtml = AddField(personaHtml, 'Title', value.title, value.sources.title);
                  personaHtml = AddField(
                    personaHtml,
                    'Department',
                    value.jobInfoDepartment,
                    value.sources.jobInfoDepartment
                  );
                  personaHtml = AddField(personaHtml, 'Company', value.companyName, value.sources.companyName);
                  personaHtml = AddField(personaHtml, 'Office', value.office, value.sources.office);
                  personaHtml = AddFieldArray(
                    personaHtml,
                    'Linked Tiltes',
                    value.linkedTitles,
                    value.sources.linkedTitles
                  );
                  personaHtml = AddFieldArray(
                    personaHtml,
                    'Linked Departments',
                    value.linkedDepartments,
                    value.sources.linkedDepartments
                  );
                  personaHtml = AddFieldArray(
                    personaHtml,
                    'Linked Companies',
                    value.linkedCompanyNames,
                    value.sources.linkedCompanyNames
                  );
                  personaHtml = AddFieldArray(
                    personaHtml,
                    'Linked Offices',
                    value.linkedOffices,
                    value.sources.linkedOffices
                  );
                  personaHtml = AddPhones(personaHtml, phones, value.sources.phones, canCallPhoneNumber);
                  personaHtml = AddField(personaHtml, 'TimeZone', value.timeZone, value.sources.timeZone);
                  personaHtml = AddAddresses(personaHtml, addresses, value.sources.addresses);
                  personaHtml = AddFieldArray(personaHtml, 'Web Sites', value.webSites, value.sources.webSites);
                  personaHtml = AddFieldArray(personaHtml, 'Note', value.notes, value.sources.notes);
                  personaHtml = EndObject(personaHtml);

                  document.getElementById('PersonaInfo').innerHTML = personaHtml;
                },
                function(detail) {
                  ReportError('retrieve(personaCapabilities)', detail);
                }
              );
            },
            function(detail) {
              ReportError('renderPersonaInfo(getInfo)', detail);
            }
          );
        },
        function(detail) {
          ReportError('renderPersonaInfo(getPhones)', detail);
        }
      );
    },
    function(detail) {
      ReportError('renderPersonaInfo(retrieve)', detail);
    }
  );
}

// Loads and renders the ids and type information for the persona
function renderPersonaIds(persona) {
  persona.retrieve({ hostId: true, diagnosticId: true, type: true }).then(
    function(value) {
      var personaHtml = '';
      personaHtml = BeginObject(personaHtml, 'Persona', 0);
      personaHtml = AddField(personaHtml, 'HostId', value.hostId);
      personaHtml = AddField(personaHtml, 'DiagnosticId', value.diagnosticId);
      personaHtml = AddField(personaHtml, 'Type', value.type);
      personaHtml = EndObject(personaHtml);

      document.getElementById('Persona').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('renderPersonaIds', detail);
    }
  );
}

// Determines if the system is allowed to go online
function RenderOnlineMode() {
  OfficeCoreOp.networkUsage.isInOnlineMode().then(
    function(value) {
      var personaHtml = '';
      personaHtml = BeginObject(personaHtml, 'Online Mode', 0);
      personaHtml = AddField(personaHtml, 'Is in online mode', value);
      personaHtml = EndObject(personaHtml);

      document.getElementById('OnlineMode').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('isInOnlineMode()', detail);
    }
  );
}

// Loads and renders the LinkedIn compliance setting
function RenderLinkedInCompliance() {
  OfficeCoreOp.linkedIn.isEnabledForOffice().then(
    function(value) {
      var personaHtml = '';
      personaHtml = BeginObject(personaHtml, 'LinkedIn Compliance', 0);
      personaHtml = AddField(personaHtml, 'Is enabled for office', value);
      personaHtml = EndObject(personaHtml);

      document.getElementById('LinkedInCompliance').innerHTML = personaHtml;

      OfficeCoreOp.linkedIn.recordLinkedInSettingsCompliance('Persona Spy RichAPI Sample', value).then(function() {});
    },
    function(detail) {
      ReportError('isEnabledForOffice()', detail);
    }
  );
}

// Loads and renders the global policies for the persona objedct
function RenderPersonaPolicies() {
  OfficeCoreOp.getPersonaPolicies().then(
    function(value) {
      var personaHtml = '';
      personaHtml = BeginObject(personaHtml, 'Policies', 0);
      personaHtml = AddField(personaHtml, 'Allow Adding Contact', value.allowAddingContact);
      personaHtml = AddField(personaHtml, 'Allow Adding Contact from GAL', value.allowAddingContactFromGal);
      personaHtml = AddField(personaHtml, 'Allow Adding IM Contacts', value.allowAddingToInstantMessengerContacts);
      personaHtml = AddField(personaHtml, 'Allow Audio Conference', value.allowAudioConference);
      personaHtml = AddField(personaHtml, 'Allow Calendar in Card', value.allowCalendarInCard);
      personaHtml = AddField(personaHtml, 'Allow Hover Card', value.allowHoverCard);
      personaHtml = AddField(personaHtml, 'Allow IM Reply', value.allowInstantMessageReply);
      personaHtml = AddField(personaHtml, 'Allow IM Reply All', value.allowInstantMessageReplyAll);
      personaHtml = AddField(personaHtml, 'Allow IM', value.allowInstantMessages);
      personaHtml = AddField(personaHtml, 'Allow Location in Card', value.allowLocationInCard);
      personaHtml = AddField(personaHtml, 'Allow My Site', value.allowMySite);
      personaHtml = AddField(personaHtml, 'Allow Outlook Properties', value.allowOutlookProperties);
      personaHtml = AddField(personaHtml, 'Allow Photos', value.allowPhotos);
      personaHtml = AddField(personaHtml, 'Allow Presence Icon', value.allowPresenceIcon);
      personaHtml = AddField(personaHtml, 'Allow Schedule a Meeting', value.allowScheduleAMeeting);
      personaHtml = AddField(personaHtml, 'Allow Sending Mail', value.allowSendingMail);
      personaHtml = AddField(personaHtml, 'Allow Tag for Alerts', value.allowTagForAlerts);
      personaHtml = AddField(personaHtml, 'Allow Voice and Video Calls', value.allowVoiceAndVideoCalls);
      personaHtml = EndObject(personaHtml);

      document.getElementById('PersonaPolicies').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('renderPersonaPolicies(getPersonaPolicies)', detail);
    }
  );
}

// Loads and renders the LokiToken for specified people context
function RenderLokiToken(peopleContext) {
  peopleContext.getAccountEmail().then(
    function(accountId) {
      OfficeCoreOp.getLokiTokenProvider(accountId).then(
        function(provider) {
          provider.requestTokenAsync().then(
            function(value) {
              var personaHtml = '';
              personaHtml = BeginObject(personaHtml, 'Loki Token', 0);
              personaHtml = AddField(personaHtml, 'Account Email', accountId);
              personaHtml = AddField(personaHtml, 'Is Available', value.isAvailable);
              personaHtml = AddField(personaHtml, 'AutoDiscover Url', value.lokiAutoDiscoverUrl);
              personaHtml = EndObject(personaHtml);

              document.getElementById('LokiToken').innerHTML = personaHtml;
            },
            function(detail) {
              ReportError('renderLokiToken(requestTokenAsync)', detail);
            }
          );

          provider.requestIdentityUniqueIdAsync().then(
            function(value) {
              var actionHtml = BuildConditionalActionHtml(true, 'LinkedIn Binding', 'CallTwoWayLinkedInBind');

              var personaHtml = '';
              personaHtml = BeginObject(personaHtml, 'LinkedIn Binding', 0);
              personaHtml = AddField(personaHtml, 'Is Available', value.isAvailable, undefined, actionHtml);
              personaHtml = EndObject(personaHtml);

              document.getElementById('IdentityUniqueId').innerHTML = personaHtml;
            },
            function(detail) {
              ReportError('renderLokiToken(requestIdentityUniqueIdAsync)', detail);
            }
          );
        },
        function(detail) {
          ReportError('renderLokiToken(getLokiTokenProvider)', detail);
        }
      );
    },
    function(detail) {
      ReportError('renderLokiToken(getAccountEmail)', detail);
    }
  );
}

// Trys and get the service url, return an empty string if it cannot be obtained
function TryGetServiceUrl(accountId, url) {
    var promise = new OfficeExtension.CoreUtility.Promise(function (resolve) {
        OfficeCoreOp.serviceUrlProvider.getServiceUrl(accountId, url)
            .then(function (serviceUrl) { resolve(serviceUrl); })
            .catch(function(error) {
                ReportError('TryGetServiceUrl', error.message);
                resolve("");
            });
    });

    return promise;
}

// Loads and renders the Aria service urls
function RenderServiceUrls(peopleContext) {
    peopleContext.getAccountEmail().then(function (accountId) {
        TryGetServiceUrl(accountId, OfficeCoreOp.ServiceProvider.ariaBrowserPipeUrl).then(function (browserPipeUrl) {
            var personaHtml = '';
            personaHtml = BeginObject(personaHtml, 'Aria Service Url', 0);
            personaHtml = AddField(personaHtml, 'Account Email', accountId);
            personaHtml = AddField(personaHtml, 'Browser Pipe Url', browserPipeUrl);
            personaHtml = EndObject(personaHtml);
            document.getElementById('ServiceUrls').innerHTML = personaHtml;
        }).catch(function (error) { ReportError('RenderServiceUrls(ariaBrowserPipeUrl)', error.message); });
    }).catch(function (error) { ReportError('RenderServiceUrls(getAccountEmail)', error.message); });
}

// Loads the date time format strings and renders the current
function RenderDateTimeFormatForTimeAndLocale(now, nowAsIsoString, userLocale, title, section) {
    OfficeCoreOp.localeApi.getLocaleDateTimeFormattingInfo(userLocale).then(function (info) {
        OfficeCoreOp.localeApi.formatDateTimeString(userLocale, nowAsIsoString, "ShortTime").then(function (shortTime) {
            OfficeCoreOp.localeApi.formatDateTimeString(userLocale, nowAsIsoString, "LongTime").then(function (longTime) {
                OfficeCoreOp.localeApi.formatDateTimeString(userLocale, nowAsIsoString, "ShortDate").then(function (shortDate) {
                    OfficeCoreOp.localeApi.formatDateTimeString(userLocale, nowAsIsoString, "LongDate").then(function (longDate) {
                        var html = '';
                        html = BeginObject(html, title, 0);
                        html = AddField(html, 'Locale', userLocale);
                        html = AddField(html, 'Time Format', info.longTimeFormat);
                        html = AddField(html, 'Short Time Format', info.shortTimeFormat);
                        html = AddField(html, 'Date Format', info.longDateFormat);
                        html = AddField(html, 'Short Date Format', info.shortDateFormat);
                        html = AddField(html, 'AM Marker', info.timeMarkerAM);
                        html = AddField(html, 'Short AM Marker', info.timeMarkerAMShort);
                        html = AddField(html, 'PM Marker', info.timeMarkerPM);
                        html = AddField(html, 'Short PM Marker', info.timeMarkerPMShort);

                        html = AddFieldArray(html, 'Day Names', info.dayNames);
                        html = AddFieldArray(html, 'Short Day Names', info.shortDayNames);

                        html = AddFieldArray(html, 'Day Names', info.monthNames);
                        html = AddFieldArray(html, 'Short Day Names', info.shortMonthNames);
                        html = EndObject(html);

                        html = BeginObject(html, 'Formatted Date Time', 0);
                        html = AddField(html, 'Date/Time', now);
                        html = AddField(html, 'Date/Time ISO String', nowAsIsoString);
                        html = AddField(html, 'Short Time', shortTime);
                        html = AddField(html, 'Long Time', longTime);
                        html = AddField(html, 'Short Date', shortDate);
                        html = AddField(html, 'Long Date', longDate);
                        html = EndObject(html);

                        document.getElementById(section).innerHTML = html;
                    });
                });
            });
        });
    }).catch(function (error) { ReportError('RenderDateTimeFormat', error.message); });
}

// Loads the date time format strings and renders the current
function RenderDateTimeFormat() {
    var now = new Date();
    var nowAsIsoString = now.toISOString();
    var userLocale = window.external.UserLocale();
    RenderDateTimeFormatForTimeAndLocale(now, nowAsIsoString, userLocale, 'Date and Time Formats', 'DateTimeFormats');
    RenderDateTimeFormatForTimeAndLocale(now, nowAsIsoString, '', 'Date and Time Formats (Empty Locale)', 'DateTimeFormatsEmptyString');
    RenderDateTimeFormatForTimeAndLocale(now, nowAsIsoString, undefined, 'Date and Time Formats (Undefined Locale)', 'DateTimeFormatsUndefinedString');
}

function AddFieldForAction(personaHtml, name, value, actionfunc) {
  if (value != undefined && (value != '' || typeof value == 'boolean')) {
    personaHtml = personaHtml + name + ': ' + value;
    if (source != undefined) {
      if (source != '') {
        personaHtml = personaHtml + ' (' + source + ')';
      }
    }

    personaHtml = personaHtml + '<br>';
  }

  return personaHtml;
}

//
// Functions to invoke various actions on the initial persona
//
function InvokeAddContact() {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.addContact();
  });
}

function InvokeCallPhoneNumber(contactNumber) {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.callPhoneNumber(contactNumber);
  });
}

function InvokeComposeEmail(emailAddress) {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.composeEmail(emailAddress);
  });
}

function InvokeComposeInstantMessage(sipAddress) {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.composeInstantMessage(sipAddress);
  });
}

function InvokeEditContact() {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.editContact();
  });
}

function InvokeEditContactByIdentifier(identifier) {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.editContactByIdentifier(identifier);
  });
}

function InvokeOpenLinkContactUx() {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.openLinkContactUx();
  });
}

function InvokePinPersonaToQuickContacts() {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.pinPersonaToQuickContacts();
  });
}

function InvokeScheduleMeeting() {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.scheduleMeeting();
  });
}

function InvokeToggleTagForAlerts() {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(function(persona) {
    persona.actions.toggleTagForAlerts();
  });
}

// Function to invoke the binding Ux
function CallBindingUX(uniqueId) {
  var managerApi = OfficeCoreOp.officeServicesManagerApi;
  managerApi.bindServiceToProfile('FP_LINKEDIN_2WAY', uniqueId, window.external.GenerateGuid()).then(
    function(result) {
      alert('Binding Result: ' + result);
    },
    function(detail) {
      ReportError('CallBindingUX(bindServiceToProfile)', detail);
    }
  );
}

// Function to invoke the binding Ux
function CallTwoWayLinkedInBind() {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.launchLinkedIn2WayBinding(window.external.GenerateGuid()).then(
    function(result) {
      alert('Binding Result: ' + result);
    },
    function(detail) {
      ReportError('CallTwoWayLinkedInBind(launchLinkedIn2WayBinding)', detail);
    }
  );
}

// Helper function that builds the button for performing the specified action
function BuildConditionalActionHtml(check, title, method, data) {
  var response = '';
  if (check) {
    response = ' <button onclick="' + method + '(';
    if (data != undefined) {
      response = response + "'" + data + "'";
    }
    response = response + ')">' + title + '</button>';
  }

  return response;
}

// Loads and renders the global policies for the persona objedct
function renderCapabilities(persona) {
  persona.retrieve({ capabilities: true }).then(
    function(value) {
      var personaHtml = '';
      personaHtml = BeginObject(personaHtml, 'Capabilities', 1);
      personaHtml = AddField(
        personaHtml,
        'Can Add Contact',
        value.capabilities.canAddContact,
        '',
        BuildConditionalActionHtml(value.capabilities.canAddContact, 'Add', 'InvokeAddContact')
      );
      personaHtml = AddField(
        personaHtml,
        'Can Edit Contact',
        value.capabilities.canEditContact,
        '',
        BuildConditionalActionHtml(value.capabilities.canEditContact, 'Edit', 'InvokeEditContact')
      );
      personaHtml = AddField(
        personaHtml,
        'Can Link Contacts',
        value.capabilities.canLinkContacts,
        '',
        BuildConditionalActionHtml(value.capabilities.canLinkContacts, 'Link', 'InvokeOpenLinkContactUx')
      );
      personaHtml = AddField(
        personaHtml,
        'Can Pin to Favorites',
        value.capabilities.canPinToFavorites,
        '',
        BuildConditionalActionHtml(value.capabilities.canPinToFavorites, 'Pin', 'InvokePinPersonaToQuickContacts')
      );
      personaHtml = AddField(
        personaHtml,
        'Can Tag for Alerts',
        value.capabilities.canTagForAlerts,
        '',
        BuildConditionalActionHtml(value.capabilities.canTagForAlerts, 'Tag', 'InvokeToggleTagForAlerts')
      );
      personaHtml = AddField(
        personaHtml,
        'Can Untag for Alerts',
        value.capabilities.canUntagForAlerts,
        '',
        BuildConditionalActionHtml(value.capabilities.canUntagForAlerts, 'Un Tag', 'InvokeToggleTagForAlerts')
      );
      personaHtml = AddField(
        personaHtml,
        'Can Schedule Meeting',
        value.capabilities.canScheduleMeeting,
        '',
        BuildConditionalActionHtml(value.capabilities.canScheduleMeeting, 'Schedule', 'InvokeScheduleMeeting')
      );
      personaHtml = AddField(personaHtml, 'Can Compose Instant Message', value.capabilities.canComposeInstantMessage);
      personaHtml = AddField(personaHtml, 'Can Call Phone Number', value.capabilities.canCallPhoneNumber);
      personaHtml = AddField(personaHtml, 'Has Customizations', value.capabilities.hasCustomizations);
      personaHtml = AddField(personaHtml, 'Can Provide Photo', value.capabilities.canProvidePhoto);
      personaHtml = AddField(personaHtml, 'Can Provide Persona Info', value.capabilities.canProvidePersonaInfo);
      personaHtml = AddField(
        personaHtml,
        'Can Provide Unified CommunicationInfo ',
        value.capabilities.canProvideUnifiedCommunicationInfo
      );
      personaHtml = AddField(personaHtml, 'Can Provide Organization', value.capabilities.canProvideOrganization);
      personaHtml = AddField(
        personaHtml,
        'Can Provide Unified Group Info',
        value.capabilities.canProvideUnifiedGroupInfo
      );
      personaHtml = AddField(personaHtml, 'Can Provide Members', value.capabilities.canProvideMembers);
      personaHtml = AddField(personaHtml, 'Can Provide Membership', value.capabilities.canProvideMembership);
      personaHtml = AddField(personaHtml, 'Can Provide Customizations', value.capabilities.canProvideCustomizations);
      personaHtml = AddField(personaHtml, 'Can Provide Viewable Sources', value.capabilities.canProvideViewableSources);
      personaHtml = AddField(
        personaHtml,
        'Is Org data from O365 using NSPI',
        value.capabilities.isOrgDataFromO365UsingNSPI
      );
      personaHtml = AddField(
        personaHtml,
        'Is Member data from O365 using NSPI',
        value.capabilities.isMemberDataFromO365UsingNSPI
      );
      personaHtml = AddField(
        personaHtml,
        'Is Membership data from O365 using NSPI',
        value.capabilities.isMemberOfDataFromO365UsingNSPI
      );
      personaHtml = AddField(personaHtml, 'Can Show Presence',value.capabilities.canShowPresence);
      personaHtml = EndObject(personaHtml);

      document.getElementById('Capabilities').innerHTML = personaHtml;
    },
    function(detail) {
      ReportError('renderCapabilities(retrieve)', detail);
    }
  );
}

// Variables that identify the persona
var hostId;
var eventHandler;
var instanceId;
var isVerboseLogging;

/**
 * Renders the persona based on the supplied hostId
 * @param {any} personaHostId
 */
function renderPersona(personaHostId) {
  var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  RenderServiceUrls(peopleContext);
  RenderOnlineMode();
  RenderLinkedInCompliance();
  RenderLokiToken(peopleContext);
  RenderPersonaPolicies();
  if (isVerboseLogging){
    RenderDateTimeFormat();
  }


  peopleContext.getPersonaLifetime().then(
    function(lifetime) {
      lifetime.getPersona(personaHostId).then(
        function(persona) {
          renderPersonaIds(persona);
          renderPersonaInfo(persona);
          renderPhoto(persona);
          renderUnifiedCommunicationInfo(persona);
          renderUnifiedGroupInfo(persona);
          renderOrganization(persona);
          renderMemberships(persona);
          renderMembers(persona);
          renderViewableSources(persona);
          renderCustomizations(persona);
          renderCapabilities(persona);
        },
        function(detail) {
          ReportError('renderPersona(getPersona)', detail);
        }
      );
    },
    function(detail) {
      ReportError('renderPersona(getPersonaLifetime)', detail);
    }
  );
}

function LogPersonaUpdate(hostId, dataUpdated) {
  if (dataUpdated != undefined) {
    var currentTime = new Date();
    var update =
      currentTime.getHours() +
      ':' +
      currentTime.getMinutes() +
      ':' +
      currentTime.getSeconds() +
      ' Persona Updated (' +
      hostId +
      ') : ';
    for (var index = 0; index < dataUpdated.length; ++index) {
      if (index != 0) {
        update = update + ', ';
      }

      update = update + dataUpdated[index];
    }

    update = update + '<br>';

    var updateHtml = document.getElementById('PersonaUpdates').innerHTML + update;
    document.getElementById('PersonaUpdates').innerHTML = updateHtml;
  }
}

// Perform Step 1 of an initialization of the OfficeExtensionBatch
window.OfficeExtensionBatch = window.OfficeExtension;

function LoadPersonaSpy() {
  instanceId = window.external.GetInstanceId();

  isVerboseLogging = window.external.IsVerboseLoggingEnabled();
  if (isVerboseLogging) {
    document.getElementById('MessagesHeader').innerHTML = "<h3>RichAPI Messages</h3>";

    // Setup the sensor methods for messages sent from/to the host
    PersonaSpyBridgeSensor.onSendMessageToHostSensor = function (value) {
      logMessage("<b>To Host:</b> " + value);
    }

    PersonaSpyBridgeSensor.onMessageFromHostSensor = function (value) {
      logMessage("<b>From Host:</b> " + value);
    }
  }

    var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
  peopleContext.getInitialPersona().then(
    function(persona) {
      var dataToLoad = [
        OfficeCoreOp.PersonaDataUpdated.hostId,
        OfficeCoreOp.PersonaDataUpdated.type,
        OfficeCoreOp.PersonaDataUpdated.photo,
        OfficeCoreOp.PersonaDataUpdated.personaInfo,
        OfficeCoreOp.PersonaDataUpdated.unifiedCommunicationInfo,
        OfficeCoreOp.PersonaDataUpdated.organization,
        OfficeCoreOp.PersonaDataUpdated.unifiedGroupInfo,
        OfficeCoreOp.PersonaDataUpdated.members,
        OfficeCoreOp.PersonaDataUpdated.membership,
        OfficeCoreOp.PersonaDataUpdated.capabilities,
        OfficeCoreOp.PersonaDataUpdated.customizations
      ];

      persona.warmup(dataToLoad);

      // Test reportTimeForRender richAPI
      persona.reportTimeForRender("PlaceHolderRendered", Date.now());

      persona.getPersonaInfoAsync(OfficeCoreOp.PersonaPromiseType.immediate).then(
        function(value) {
          var personaHtml = '';
          personaHtml = AddField(personaHtml, 'IsResolved', value.infoAndSources.isPersonResolved);
          personaHtml = AddField(personaHtml, 'Name', value.infoAndSources.displayName);
          personaHtml = AddField(personaHtml, 'Email', value.infoAndSources.email);
          document.getElementById('PersonaAsyncData').innerHTML = personaHtml;
        },
        function(detail) {
          ReportError('LoadPersonaSpy(getPersonaInfoAsync)', detail);
        }
      );

      persona.retrieve({ type: true, hostId: true, diagnosticId: true }).then(
        function(value) {
          hostId = value.hostId;

          var peopleContext = new OfficeCoreOp.PeopleApiContext(instanceId);
          peopleContext.getPersonaLifetime().then(
            function(lifetime) {
              eventHandler = lifetime.on('PersonaUpdated', function(args) {
                if (args.sendingPersonaHostId == hostId) {
                  renderPersona(hostId);
                } else {
                  // check to see if the persona is part of a hierarchy and if
                  // it is render the updated persona data
                  renderPersonaSummary(args.sendingPersonaHostId);
                }

                var personaHostId = args.sendingPersonaHostId;
                var dataUpdated = args.dataUpdated;
                LogPersonaUpdate(personaHostId, dataUpdated);
              });
            },
            function(detail) {
              ReportError('LoadPersonaSpy(getPersonaLifetime)', detail);
            }
          );

              renderPersona(hostId);

          // Test reportTimeForRender richAPI
          persona.reportTimeForRender("InitialCardRendered", Date.now());
        },
        function(detail) {
          ReportError('LoadPersonaSpy(persona.retrieve)', detail);
        }
      );
    },
    function(detail) {
      ReportError('LoadPersonaSpy(getInitialPersona)', detail);
    }
  );
}

// Perform Step 2, loading PersonaSpy
LoadPersonaSpy();
