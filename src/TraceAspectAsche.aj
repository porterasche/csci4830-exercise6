
public aspect TraceAspectAsche {
	pointcut classTracer(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	pointcut methodTracer(): classTracer() && execution(String getName());
	
	before(): methodTracer() {
		String info = thisJoinPointStaticPart.getSignature() + ", " + thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("\t-->" + info);
	}
	
	after(): methodTracer() {
		String info = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("\t<--" + info);
	}
}
