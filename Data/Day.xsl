<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Day.xsl
    Created on : April 5, 2016, 12:58 PM
    Author     : Alex
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Day.xsl</title>
            </head>
            <h1>Sched by Days</h1>
            <table>
                <xsl:call-template name='daysoweek'/>
                <xsl:call-template name='dataz'/>
            </table>
        </html>
    </xsl:template>
    
    <xsl:template name='daysoweek'>
        <thead>
            <tr>
                <th></th>
                <xsl:for-each select='/Sched/week/day'>
                    <th>
                        <xsl:value-of select='./@which'/>
                    </th>
                </xsl:for-each>
            </tr>
        </thead>        
    </xsl:template>
    
    <xsl:template name='dataz'>            
        <xsl:for-each select='/Sched/timeSched/time'>
            <xsl:variable name='currentTime' select='./@which'/>
            <tr>
                <td>
                    <xsl:value-of select='$currentTime'/>
                </td>
                <xsl:for-each select='/Sched/week/day'>
                    <td>
                        <xsl:for-each select='./weekslot'>
                            <xsl:if test='./@period = $currentTime'>
                                <xsl:value-of select='./@course'/>
                                <br/>
                                <xsl:value-of select='./instructor'/>
                                <br/>
                                <xsl:value-of select='./room'/>
                                <br/>
                            </xsl:if>
                        </xsl:for-each>
                    </td>              
                </xsl:for-each> 
            </tr> 
        </xsl:for-each>               
    </xsl:template>

</xsl:stylesheet>
