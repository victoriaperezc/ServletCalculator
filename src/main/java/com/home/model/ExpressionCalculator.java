package com.home.model;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ExpressionCalculator {
    private Deque<String> stackOps = new ArrayDeque<String>();
    private List<String> postfix = new ArrayList<String>();
    private String infix;

    public ExpressionCalculator (String infix) {
        this.infix = infix;
    }

    public List<String> fromInfixToPostfix() throws Exception {

        StringBuilder temp = new StringBuilder("");
        char ch;

        if (checkExpression()) {
            throw new Exception("Wrong Input");

        }

        for (int i = 0; i < infix.length(); i++) {
            ch = infix.charAt(i);
            if (!Character.isDigit(ch) && ch != '.' && temp.length() > 0) {
                postfix.add(temp.toString());
                temp.delete(0, temp.length());
            }
            if (ch == '-' && ( i == 0 || infix.charAt(i-1) == '(')) {
                postfix.add("0");
            }
            switch (ch) {
                case '+':
                case '-':
                    putOper(ch, 1);
                    break;
                case '*':
                case '/':
                    putOper(ch, 2);
                    break;
                case '^':
                    putOper(ch, 3);
                    break;
                case '(':
                    stackOps.push(String.valueOf(ch));
                    break;
                case ')':
                    putParen();
                    break;
                default:
                    temp.append(ch);
            }
        }
        if (temp.length() > 0) {
            postfix.add(temp.toString());
        }
        while (stackOps.size() > 0) {
            postfix.add(stackOps.pop());
        }
        return postfix;
    }

    private void putOper(char operThis, int priorThis) {

        char operTop;

        while (stackOps.size() > 0) {
            operTop = stackOps.pop().charAt(0);
            if (operTop == '(') {
                stackOps.push(String.valueOf(operTop));
                break;
            } else {
                int priorTop = 1;

                switch (operTop) {
                    case '+':
                    case '-':
                        priorTop = 1;
                        break;
                    case '*':
                    case '/':
                        priorTop = 2;
                        break;
                    case '^':
                        priorTop = 3;
                        break;
                    default:
                }
                if (priorTop < priorThis) {
                    stackOps.push(String.valueOf(operTop));
                    break;
                } else {
                    postfix.add(String.valueOf(operTop));
                }
            }
        }
        stackOps.push(String.valueOf(operThis));
    }

    private void putParen() {

        while (stackOps.size() > 0) {
            char ch = stackOps.pop().charAt(0);
            if (ch == '(')
                break;
            else
                postfix.add(String.valueOf(ch));

        }
    }

    private boolean checkExpression() {
        Pattern pattern = Pattern.compile(".*[^\\d.+*/^()-].*");
        Matcher matcher = pattern.matcher(infix);
        return  matcher.matches();
    }

    public double calculatePostfix() {

        Deque<Double> stackNums = new ArrayDeque<Double>();
        double a = 0, b = 0, r = 0;

        for (String element: postfix) {
            if (!Character.isDigit(element.charAt(0))) {
                b = stackNums.pop();
                a = stackNums.pop();
                switch (element.charAt(0)) {
                    case '+':
                        r = a + b;
                        break;
                    case '-':
                        r = a - b;
                        break;
                    case '/':
                        r = a / b;
                        break;
                    case '*':
                        r = a * b;
                        break;
                    case '^':
                        r = Math.pow(a, b);
                        break;
                    default:
                }
                stackNums.push(r);
            } else {
                r = Double.parseDouble(element);
                stackNums.push(r);
            }
        }
        return stackNums.pop();
    }
}
