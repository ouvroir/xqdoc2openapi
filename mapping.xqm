xquery version "3.1" ;
module namespace oapi.mapping = 'oapi.mapping' ;

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

declare default function namespace 'oapi.mapping' ;

(:~
 : this function dispatches the treatment of the XML document
 :)
declare
  %output:indent('no')
function dispatch($node as node()*, $options as map(*)) as item()* {
  typeswitch($node)
    case text() return $node[fn:normalize-space(.)!='']
    case element(xqdoc:persName) return persName($node, $options)
    default return passthru($node, $options)
};

(:~
 : this function pass through child nodes (xsl:apply-templates)
 :)
declare
  %output:indent('no')
function passthru($nodes as node(), $options as map(*)) as item()* {
  for $node in $nodes/node()
  return dispatch($node, $options)
};

declare function persName($u, $a){''};