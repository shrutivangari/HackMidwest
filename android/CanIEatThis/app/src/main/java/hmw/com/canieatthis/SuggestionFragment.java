package hmw.com.canieatthis;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link SuggestionFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link SuggestionFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class SuggestionFragment extends android.support.v4.app.Fragment implements View.OnClickListener {
    private static final String ARG_SECTION_NUMBER = "section_number";
    private String TAG = "SuggestFramgment";

    private Context context;


    private OnFragmentInteractionListener mListener;

    TextView tvResult;
    EditText etQuery;
    TextView tvReason;
    TextView tvOtherSuggLabel;
    ListView lvOtherFood;

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @return A new instance of fragment SuggestionFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static SuggestionFragment newInstance(int param1, String email) {
        SuggestionFragment fragment = new SuggestionFragment();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, param1);
        args.putString("email", email);
        fragment.setArguments(args);
        return fragment;
    }

    public SuggestionFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        context = getActivity().getApplicationContext();

        if (getArguments() != null) {

        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View fragmentView = inflater.inflate(R.layout.fragment_suggestion, container, false);

        lvOtherFood = (ListView)fragmentView.findViewById(R.id.sugg_otherfood);
        tvReason = (TextView)fragmentView.findViewById(R.id.sugg_reason);
        tvOtherSuggLabel = (TextView)fragmentView.findViewById(R.id.sugg_othersugg);

        etQuery = (EditText)fragmentView.findViewById(R.id.sugg_text);
        // etQuery.setOnClickListener(this);

        etQuery.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (actionId == EditorInfo.IME_ACTION_SEARCH) {
                    new SuggestionNWTask(etQuery.getText().toString(), getArguments().getString("email")).execute((Void) null);
                    return true;
                }
                return false;
            }
        });

        tvResult = (TextView)fragmentView.findViewById(R.id.sugg_result);
        return fragmentView;
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);

        ((HomeActivity) activity).onSectionAttached(
                getArguments().getInt(ARG_SECTION_NUMBER));

        try {
            mListener = (OnFragmentInteractionListener) activity;
        } catch (ClassCastException e) {
            throw new ClassCastException(activity.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    @Override
    public void onClick(View v) {
//        if(v.getId() == R.id.sugg_submit) {
//            new SuggestionNWTask(((EditText)this.getActivity().findViewById(R.id.sugg_text)).getText().toString()).execute((Void)null);
//        }
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p/>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        public void onFragmentInteraction(Uri uri);
    }

    /**
     * Suggestions network task.
     */
    public class SuggestionNWTask extends AsyncTask<Void, Void, Boolean> {

        private final String food;
        private final String email;
        private String result = "";

        SuggestionNWTask(String food, String email) {
            this.food = food;
            this.email = email;
        }

        @Override
        protected Boolean doInBackground(Void... params) {

            try {
                // HttpURLConnection connection = (HttpURLConnection)new URL(" http://demo6044438.mockable.io/hmw/recommendation?userid=100").openConnection();
                HttpURLConnection connection = (HttpURLConnection)new URL("http://gumdelli.pagekite.me/suggestions.json?email="+email+"&condition=null&food="+food).openConnection();

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
                            new ArrayAdapter<String>(context, R.layout.customlist, suggestion);
                    lvOtherFood.setAdapter(itemsAdapter);


                } catch(JSONException e) {
                    e.printStackTrace();
                }

           } else {
                tvReason.setText("Network error");
           }
        }

        @Override
        protected void onCancelled() {
//            showProgress(false);
        }
    }

}
