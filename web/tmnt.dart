/* Part 1
import 'dart:html';

void main()
{
  //replaces getElementById, called selectors
  //https://www.dartlang.org/articles/improving-the-dom/
  querySelector( '#inputName' ).onInput.listen( updateText );
  //querySelector( '#inputName2' ).onInput.listen( updateText );

}


void updateText( Event e )
{ 
  //1
  querySelector( '#textName' ).text = e.target.value;
  //OR 2
  //querySelector( '#textName' ).text = ( e.target as InputElement ).value;
}
*/
//////////////////////////////////////////////////////////////////////////

/*Part 2
import 'dart:html';

ButtonElement genButton;

void main()
{
  //replaces getElementById, called selectors
  //https://www.dartlang.org/articles/improving-the-dom/
  querySelector( '#inputName' ).onInput.listen( updateText );
  
  genButton = querySelector( '#generateButton' );
  genButton.onClick.listen( generateText );

}

void updateText( Event e )
{  
  String inputName = ( e.target as InputElement ).value;
  
  setTextName( inputName );
  if( inputName.trim().isEmpty )
  {
    //write this way for object
    //genButton.disabled = false;
    //genButton.text = 'Watts your name dude?';
    //OR shorthand
    genButton..disabled = false
             ..text = 'Watts your name dude?';
  } 
  else 
  {
    genButton..disabled = true
             ..text = 'Dude! Write yer name!';
  }
  
}

void setTextName( String newName )
{
  querySelector( '#textName' ).text = newName;
} 

void generateText( Event e )
{
  setTextName( 'Vince Garcia' );
}
*/

//////////////////////////////////////////////////////////////////////////
//keywords dart uses
//https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html#keyword_table

//youtube - google dart rasim
//http://www.rasmurtech.com/?s=dart

/*Part 3 S4
import 'dart:html';

//API - https://api.dartlang.org/apidocs/channels/stable/#dart-math
//https://api.dartlang.org/apidocs/channels/stable/#dart-math.Random
import 'dart:math' show Random;


ButtonElement genButton;

void main()
{
  //replaces getElementById, called selectors
  //https://www.dartlang.org/articles/improving-the-dom/
  querySelector( '#inputName' ).onInput.listen( updateText );
  
  genButton = querySelector( '#generateButton' );
  genButton.onClick.listen( generateText );

}

void updateText( Event e )
{  
  String inputName = ( e.target as InputElement ).value;
  
  setTextName( new TurtleName( firstName: inputName ) );
  if( inputName.trim().isEmpty )
  {
    //write this way for object
    //genButton.disabled = false;
    //genButton.text = 'Watts your name dude?';
    //OR shorthand
    genButton..disabled = false
             ..text = 'Watts your name dude?';
  } 
  else 
  {
    genButton..disabled = true
             ..text = 'Dude! Write yer name!';
  }
  
}

void generateText( Event e )
{
  setTextName( new TurtleName() );
}

void setTextName( TurtleName newName )
{
  querySelector( '#textName' ).text = newName.turtleName;
} 

class TurtleName
{
  static final Random indexGen = new Random();

  String _firstName;
  String _title;

  TurtleName( { String firstName, String title } )
  {
    if( firstName == null )
    {
      _firstName = names[ indexGen.nextInt( names.length ) ];
    } 
    else 
    {
      _firstName = firstName;
    }
    
    if( title == null )
    {
      _title = titles[ indexGen.nextInt( titles.length ) ];
    } 
    else 
    {
      _title = title;
    }
  }

  String toString() => turtleName;

  String get turtleName => _firstName.isEmpty ? '' : '$_firstName the $_title';

  static final List names = [ 'Leo', 'Donny', 'Raph', 'Mickey', 'Splinter', 'Shredder' ];
  static final List titles = [ 'Fearless','Rude', 'Wild', 'Intelligent', 'Awesomeness', 'Wicked' ];
}
*/

//////////////////////////////////////////////////////////////////////////
//keywords dart uses
//https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html#keyword_table

//youtube - google dart rasim
//http://www.rasmurtech.com/?s=dart
//API - https://api.dartlang.org/apidocs/channels/stable/#dart-math
//https://api.dartlang.org/apidocs/channels/stable/#dart-math.Random


/*Part 4 S5
import 'dart:html';
import 'dart:math' show Random;

//https://api.dartlang.org/apidocs/channels/stable/#dart-convert
import 'dart:convert' show JSON;

final String TURTLE_KEY = 'turtleName';

ButtonElement genButton;

void main()
{
  querySelector( '#inputName' ).onInput.listen( updateText );
  
  genButton = querySelector( '#generateButton' );
  genButton.onClick.listen( generateText );
  
  setTextName( getTextNameFromStorage() );
}

void updateText( Event e )
{  
  String inputName = ( e.target as InputElement ).value;
  
  setTextName( new TurtleName( firstName: inputName ) );
  if( inputName.trim().isEmpty )
  {
    genButton..disabled = false
             ..text = 'Watts your name dude?';
  } 
  else 
  {
    genButton..disabled = true
             ..text = 'Dude! Write yer name!';
  }
  
}

void generateText( Event e )
{
  setTextName( new TurtleName() );
}

void setTextName( TurtleName newName )
{
  if (newName == null) 
  {
    return;
  }
  
  querySelector('#textName').text = newName.turtleName;
  window.localStorage[TURTLE_KEY] = newName.jsonString;
} 

TurtleName getTextNameFromStorage() 
{
  //https://api.dartlang.org/apidocs/channels/stable/#dart-dom-html.Window@id_localStorage
  String storedName = window.localStorage[TURTLE_KEY];
  
  if (storedName != null) 
  {
    return new TurtleName.fromJSON(storedName);
  } 
  else 
  {
    return null;
  }
}


class TurtleName
{
  static final Random indexGen = new Random();

  String _firstName;
  String _title;

  TurtleName( { String firstName, String title } )
  {
    if( firstName == null )
    {
      _firstName = names[ indexGen.nextInt( names.length ) ];
    } 
    else 
    {
      _firstName = firstName;
    }
    
    if( title == null )
    {
      _title = titles[ indexGen.nextInt( titles.length ) ];
    } 
    else 
    {
      _title = title;
    }
  }
  
  TurtleName.fromJSON( String jsonString ) 
  {
    //https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html#maps
    Map storedName = JSON.decode( jsonString );
    _firstName = storedName[ 'f' ];
    _title = storedName[ 't' ];
  }

  String toString() => turtleName;
  
  String get jsonString => '{ "f": "$_firstName", "t": "$_title" } ';

  String get turtleName => _firstName.isEmpty ? '' : '$_firstName the $_title';

  static final List names = [ 'Leo', 'Donny', 'Raph', 'Mickey', 'Splinter', 'Shredder' ];
  static final List titles = [ 'Fearless','Rude', 'Wild', 'Intelligent', 'Awesomeness', 'Wicked' ];
}*/

//////////////////////////////////////////////////////////////////////////
//keywords dart uses
//https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html#keyword_table

//youtube - google dart rasim
//http://www.rasmurtech.com/?s=dart
//API - https://api.dartlang.org/apidocs/channels/stable/#dart-math
//https://api.dartlang.org/apidocs/channels/stable/#dart-math.Random
//https://api.dartlang.org/apidocs/channels/stable/#dart-convert

/*Part 5 S6*/
import 'dart:html';
import 'dart:math' show Random;
import 'dart:convert' show JSON;
//https://api.dartlang.org/apidocs/channels/stable/#dart-async
import 'dart:async' show Future;

final String TURTLE_KEY = 'turtleName';

SpanElement textNameElement;

ButtonElement genButton;

void main()
{
  InputElement inputField = querySelector( '#inputName' );
  inputField.onInput.listen( updateText );
  
  genButton = querySelector( '#generateButton' );
  genButton.onClick.listen( generateText );
  
  
  textNameElement = querySelector( '#textName' );
  
  TurtleName.readyTheTurtles()
    .then( (_) 
    {
      //on success
      inputField.disabled = false; //enable
      genButton.disabled = false;  //enable
      setTextName( getTextNameFromStorage() );
    })
    .catchError( ( error )
    {
      print('Error initializing turtle names: $error');
      textNameElement.text = 'Bummer Dude! No names.';
    });
}

void updateText( Event e )
{  
  String inputName = ( e.target as InputElement ).value;
  
  setTextName( new TurtleName( firstName: inputName ) );
  if( inputName.trim().isEmpty )
  {
    genButton..disabled = false
             ..text = 'Watts your name dude?';
  } 
  else 
  {
    genButton..disabled = true
             ..text = 'Dude! Write yer name!';
  }
  
}

void generateText( Event e )
{
  setTextName( new TurtleName() );
}

void setTextName( TurtleName newName )
{
  if (newName == null) 
  {
    return;
  }
  
  querySelector('#textName').text = newName.turtleName;
  window.localStorage[TURTLE_KEY] = newName.jsonString;
} 

TurtleName getTextNameFromStorage() 
{
  //https://api.dartlang.org/apidocs/channels/stable/#dart-dom-html.Window@id_localStorage
  String storedName = window.localStorage[TURTLE_KEY];
  
  if (storedName != null) 
  {
    return new TurtleName.fromJSON(storedName);
  } 
  else 
  {
    return null;
  }
}


class TurtleName
{
  static final Random indexGen = new Random();

  String _firstName;
  String _title;

  TurtleName( { String firstName, String title } )
  {
    if( firstName == null )
    {
      _firstName = names[ indexGen.nextInt( names.length ) ];
    } 
    else 
    {
      _firstName = firstName;
    }
    
    if( title == null )
    {
      _title = titles[ indexGen.nextInt( titles.length ) ];
    } 
    else 
    {
      _title = title;
    }
  }
  
  TurtleName.fromJSON( String jsonString ) 
  {
    //https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html#maps
    Map storedName = JSON.decode( jsonString );
    _firstName = storedName[ 'f' ];
    _title = storedName[ 't' ];
  }

  String toString() => turtleName;
  
  String get jsonString => '{ "f": "$_firstName", "t": "$_title" } ';

  String get turtleName => _firstName.isEmpty ? '' : '$_firstName the $_title';
  
  static List<String> names = [];
  static List<String> titles = [];
  
  static Future readyTheTurtles() 
  {
    var path = 'turtleNames.json';
    //https://api.dartlang.org/apidocs/channels/stable/#dart-dom-html.HttpRequest
    return HttpRequest.getString( path )
        //https://api.dartlang.org/apidocs/channels/stable/#dart-async.Future@id_then
        .then(  _parseTurtleNamesFromJSON );
  }
  
  static _parseTurtleNamesFromJSON( String jsonString ) 
  {
    Map turlesNames = JSON.decode( jsonString );
    names = turlesNames['names']; 
    titles = turlesNames['titles'];
  }
}
