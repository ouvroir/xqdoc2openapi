xquery version "3.1" ;
module namespace oapi = 'oapi' ;

(:~
 : This module is a rest test for oapi
 :
 : @version 0.1
 : @since 2025-02-25
 : @author emchateau (Ouvroir d’histoire de l’art et de muséologie numériques)
 : @see http://ouvroir.umontreal.ca
 :
 : This module is distributed under the GNU General Public Licence,
 : see http://www.gnu.org/licenses/
 :
 :)

declare namespace http = 'http://expath.org/ns/http-client';
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization" ;
declare namespace request = 'http://exquery.org/ns/request';
declare namespace rest = "http://exquery.org/ns/restxq" ;
declare namespace web = "http://basex.org/modules/web" ;
declare namespace inspect = "http://basex.org/modules/inspect" ;
declare namespace xqdoc = "http://www.xqdoc.org/1.0" ;

declare namespace perm = "http://basex.org/modules/perm" ;
declare namespace user = "http://basex.org/modules/user" ;
declare namespace session = 'http://basex.org/modules/session' ;

declare default function namespace 'oapi' ;

(:~
 : resource function with a path-param and get-param
 :
 : @return return an XML file with params values
 :)
declare
  %rest:path('/oapi/{$itemId}')
  %rest:query-param("start", "{$start}", 1)
  %rest:query-param("count", "{$count}", 2000)
function testXml(
  $itemId as xs:string,
  $start as xs:integer,
  $count as xs:integer
  ) {
  <xml>
    <itemId>{$itemId}</itemId>
    <queryParam>
        <param>{$start}</param>
        <param>{$count}</param>
    </queryParam>
  </xml>
  };

(:~
 : resource function for the
 :
 : @return
 :)
declare
  %rest:path('/oapi/{$itemId}/json')
  %rest:produces('application/json')
  %output:media-type('application/json')
  %output:method('json')
  %rest:query-param("start", "{$start}", 1)
  %rest:query-param("count", "{$count}", 2000)
function testJson(
  $itemId as xs:string,
  $start as xs:integer,
  $count as xs:integer
  ) {
    'foo'
};

(:~
 : resource function for the
 :
 : @return
 :)
declare
  %rest:path('/oapi')
function getContext() {
    inspect:context()
  };
