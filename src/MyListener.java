import org.antlr.v4.runtime.tree.TerminalNode;
import Interpreter.InterpreterBaseListener;
import Interpreter.InterpreterParser;

public class MyListener extends InterpreterBaseListener {

    public void enterStart(InterpreterParser.StartContext ctx){
        System.out.println("Entering start: " +ctx.getText());
    }
    public void exitStart(InterpreterParser.StartContext ctx){
        System.out.println("Exiting start: " +ctx.getText());
    }

    public void enterExpression(InterpreterParser.ExpressionContext ctx){
        System.out.println("Entering Expression: "+ctx.getText());
    }
    public void exitExpression(InterpreterParser.StartContext ctx){
        System.out.println("Exiting Expression: " +ctx.getText());
    }
    public void visitTerminal(TerminalNode node){
        System.out.println("Visiting terminal: "+node.getText());
    }
}