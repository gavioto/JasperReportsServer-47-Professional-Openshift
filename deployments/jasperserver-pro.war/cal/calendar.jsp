<%--
  ~ Copyright (C) 2005 - 2011 Jaspersoft Corporation. All rights reserved.
  ~ http://www.jaspersoft.com.
  ~
  ~ Unless you have purchased  a commercial license agreement from Jaspersoft,
  ~ the following license terms  apply:
  ~
  ~ This program is free software: you can redistribute it and/or  modify
  ~ it under the terms of the GNU Affero General Public License  as
  ~ published by the Free Software Foundation, either version 3 of  the
  ~ License, or (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  ~ GNU Affero  General Public License for more details.
  ~
  ~ You should have received a copy of the GNU Affero General Public  License
  ~ along with this program. If not, see <http://www.gnu.org/licenses/>.
  --%>

<%@ taglib uri="/spring" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/scripts/jquery/theme/redmond/jquery-ui-1.8.20.custom.css" type="text/css" media="screen">


<c:if test='${userLocale != null and !empty userLocale}'>
    <script type='text/javascript' src="${pageContext.request.contextPath}/scripts/jquery/js/jquery.ui.datepicker-${fn:replace(userLocale, "_", "-")}.js"></script>
    <script type="text/javascript">
        jQuery.timepicker.regional['${userLocale}'] = {
            timeText: '<spring:message code="CAL_time" javaScriptEscape="true"/>',
        	hourText: '<spring:message code="CAL_hour" javaScriptEscape="true"/>',
        	minuteText: '<spring:message code="CAL_min" javaScriptEscape="true"/>',
        	currentText: '<spring:message code="CAL_now" javaScriptEscape="true"/>',
        	closeText: '<spring:message code="CAL_close" javaScriptEscape="true"/>',
            timeFormat: '<spring:message code="calendar.time.format" javaScriptEscape="true"/>',
            dateFormat: '<spring:message code="calendar.date.format" javaScriptEscape="true"/>'
        };
        jQuery.timepicker.setDefaults(jQuery.timepicker.regional['${userLocale}']);

        jQuery.datepicker.movePickerRelativelyToTriggerIcon = function (input, inst) {
            var offset = jQuery(input).offset().left;
            var width = parseFloat(inst.dpDiv.css('width').replace('px', ''));
            var move = offset + input.offsetWidth + width < jQuery(window).width();
            inst.dpDiv.css({
                marginLeft:move ? input.offsetWidth + 'px' : 0
            });
        };
        JRS.i18n["bundledCalendarFormat"] = '<spring:message code="calendar.date.format" javaScriptEscape="true"/>';
        JRS.i18n["bundledCalendarTimeFormat"] = '<spring:message code="calendar.time.format" javaScriptEscape="true"/>';

    </script>
</c:if>