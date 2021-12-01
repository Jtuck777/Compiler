import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import Interpreter.InterpreterParser;
import Interpreter.InterpreterLexer;
import org.antlr.v4.runtime.tree.ParseTreeWalker;


public class Main {
    public static void main(String[] args) {
        InterpreterLexer lexer = new InterpreterLexer(CharStreams.fromString("1+2+5"));
        InterpreterParser parser = new InterpreterParser(new CommonTokenStream(lexer));
        InterpreterParser.StartContext tree = parser.start();

        ParseTreeWalker walker = new ParseTreeWalker();
        MyListener l = new MyListener();
        walker.walk(l,tree);

        //parser.start();
        System.out.println("My parser has executed Order 66");
    }
}
