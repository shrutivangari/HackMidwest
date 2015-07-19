package hmw.com.canieatthis;

import android.os.AsyncTask;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;


public class GuestActivity extends ActionBarActivity implements AdapterView.OnItemSelectedListener{

    Spinner spConditions;
    EditText etQuery;
    TextView tvResult;
    TextView tvReason;
    TextView tvOtherSuggLabel;
    ListView lvOtherFood;

    String selectedCondition;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_guest);

        setTitle("Can I Eat This?");

        etQuery = (EditText)findViewById(R.id.guest_text);
        etQuery.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (actionId == EditorInfo.IME_ACTION_SEARCH) {
                    new GuestSuggestionNWTask(etQuery.getText().toString(), selectedCondition).execute((Void) null);
                    return true;
                }
                return false;
            }
        });

        tvResult = (TextView)findViewById(R.id.guest_result);
        lvOtherFood = (ListView)findViewById(R.id.guest_otherfood);
        tvReason = (TextView)findViewById(R.id.guest_reason);
        tvOtherSuggLabel = (TextView)findViewById(R.id.guest_othersugg);

        try {
            String conditions = getIntent().getStringExtra("conditions");
            JSONObject json = new JSONObject(conditions);
            JSONArray jsonConditions = json.getJSONArray("diseases");
            List<String> list = new ArrayList<String>();
            for(int i=0; i<jsonConditions.length(); i++) {
                list.add(jsonConditions.getString(i));
            }

            spConditions = (Spinner) findViewById(R.id.guest_condition2);
            ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>
                    (this, android.R.layout.simple_spinner_item, list);
            dataAdapter.setDropDownViewResource
                    (android.R.layout.simple_spinner_dropdown_item);
            spConditions.setAdapter(dataAdapter);
            spConditions.setOnItemSelectedListener(this);

        } catch(JSONException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_guest, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        selectedCondition = parent.getItemAtPosition(position).toString();
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }

    /**
     * Suggestions network task.
     */
    public class GuestSuggestionNWTask extends AsyncTask<Void, Void, Boolean> {

        private final String food;
        private final String condition;
        private String result = "";

        GuestSuggestionNWTask(String food, String condition) {
            this.food = food;
            this.condition = condition;
        }

        @Override
        protected Boolean doInBackground(Void... params) {

            try {

                // String email = "null";
                // HttpURLConnection connection = (HttpURLConnection)new URL("https://demo6044438.mockable.io/hmw/recommendation?userid=200").openConnection();
                HttpURLConnection connection = (HttpURLConnection)new URL("http://gumdelli.pagekite.me/suggestions.json?email=null&condition="+condition+"&food="+food).openConnection();

                BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line+"\n");
                }
                br.close();

                result = sb.toString();

            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }

            return true;
        }

        @Override
        protected void onPostExecute(final Boolean success) {
            if (success) {
                try {
                    JSONObject json = new JSONObject(result);
                    JSONObject result = json.getJSONObject("result");
                    boolean isRecommended = result.getString("recommended").equalsIgnoreCase("yes") ? true : false;
                    String reason = "";
                    if (!isRecommended) {
                        reason = result.getString("reason");
                    }

                    JSONObject suggestions = json.getJSONObject("suggestions");
                    JSONArray food = suggestions.getJSONArray("food");
                    ArrayList<String> suggestion = new ArrayList<String>();
                    for (int i = 0; i < food.length(); i++) {
                        suggestion.add(food.getString(i));
                    }

                    tvResult.setText(isRecommended ? "YES" : "NO");
                    tvReason.setText(reason);
                    tvOtherSuggLabel.setText("Other Suggestions");

                    ArrayAdapter<String> itemsAdapter =
                            new ArrayAdapter<String>(getApplicationContext(), R.layout.customlist, suggestion);
                    lvOtherFood.setAdapter(itemsAdapter);


                } catch(JSONException e) {
                    e.printStackTrace();
                }

            } else {

            }
        }

        @Override
        protected void onCancelled() {
//            showProgress(false);
        }
    }

}
