<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Time.xsl
    Created on : April 5, 2016, 12:58 PM
    Author     : Eagle
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Time.xsl</title>
            </head>
            <h1>Sched by Time</h1>
            <table>
                <xsl:call-template name='titlebytime'/>
                <xsl:call-template name='dataz'/>
            </table>
        </html>
    </xsl:template>

    <xsl:template name='titlebytime'>
        <thead>
            <tr>
                <th></th>
                <xsl:for-each select='/timetable/periods/period'>
                    <th>
                        <xsl:value-of select='./@which'/>
                    </th>
                </xsl:for-each>
            </tr>
        </thead>
    </xsl:template>

    <xsl:template name='dataz'>
        <xsl:for-each select='/Sched/week/day'>
            <xsl:variable name='currentDay' select='./@which'/>
            <tr>
                <td>
                    <xsl:value-of select='$currentDay'/>
                </td>
                <xsl:for-each select='/Sched/timeSched/time'>
                    <td>
                        <xsl:for-each select='./timeslot'>
                            <xsl:if test='./@day = $currentDay'>
                                <xsl:value-of select='./@course'/>
                                <xsl:value-of select='./instructor'/>
                                <xsl:value-of select='./room'/>
                            </xsl:if>
                        </xsl:for-each>
                    </td>
                </xsl:for-each>
            </tr>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>