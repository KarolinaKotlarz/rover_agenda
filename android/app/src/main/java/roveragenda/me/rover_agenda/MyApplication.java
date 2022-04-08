package roveragenda.me.rover_agenda;

import io.flutter.app.FlutterApplication;
import com.instabug.instabugflutter.InstabugFlutterPlugin;
import java.util.ArrayList;


public class MyApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        ArrayList<String> invocationEvents = new ArrayList<>();
        invocationEvents.add(InstabugFlutterPlugin.INVOCATION_EVENT_SHAKE);
        new InstabugFlutterPlugin().start(MyApplication.this, "76ed198e8e1d4438e3ff5b8b152d6e60", invocationEvents);
    }
}