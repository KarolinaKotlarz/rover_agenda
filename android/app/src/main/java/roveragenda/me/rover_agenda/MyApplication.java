package roveragenda.me.rover_agenda;

import io.flutter.app.FlutterApplication;

public class MyApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        ArrayList<String> invocationEvents = new ArrayList<>();
        invocationEvents.add(InstabugFlutterPlugin.INVOCATION_EVENT_SHAKE);
        new InstabugFlutterPlugin().start(CustomFlutterApplication.this, "76ed198e8e1d4438e3ff5b8b152d6e60", invocationEvents);
    }
}