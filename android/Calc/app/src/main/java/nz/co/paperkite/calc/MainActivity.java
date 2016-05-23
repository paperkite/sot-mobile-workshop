package nz.co.paperkite.calc;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.TextInputEditText;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class MainActivity extends AppCompatActivity {

	private static final String TAG = MainActivity.class.getSimpleName();

	@BindView(R.id.tv_answer)
	TextView tvAnswer;

	@BindView(R.id.et_value_a)
	TextInputEditText etValueA;

	@BindView(R.id.et_value_b)
	TextInputEditText etValueB;

	@BindView(R.id.btn_plus)
	Button btnPlus;
	@BindView(R.id.btn_minus)
	Button btnMinus;
	@BindView(R.id.btn_multiply)
	Button btnMultiply;
	@BindView(R.id.btn_divide)
	Button btnDivide;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		ButterKnife.bind(this);
		btnPlus.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View view) {
				plusClicked();
			}
		});
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		MenuInflater inflater = getMenuInflater();
		inflater.inflate(R.menu.main_actions, menu);

		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
			case R.id.action_about:
				Intent intent = new Intent(MainActivity.this, AboutActivity.class);
				startActivity(intent);
				return true;

			default:
				// If we got here, the user's action was not recognized.
				// Invoke the superclass to handle it.
				return super.onOptionsItemSelected(item);

		}
	}

	private void clearInputs() {
		etValueA.setText("");
		etValueB.setText("");
		tvAnswer.setText('0');
	}

	private double getValueA() {
		String value = etValueA.getText().toString();
		if(value.equals("")){
			return 0;
		}
		return Double.parseDouble(value);
	}

	private double getValueB() {
		String value = etValueB.getText().toString();
		if(value.equals("")){
			return 0;
		}
		return Double.parseDouble(value);
	}

	@OnClick(R.id.btn_plus)
	public void plusClicked() {
		Log.d(TAG, "Plus clicked: "+ getValueA());
		double answer = getValueA() + getValueB();
		tvAnswer.setText(String.valueOf(answer));
	}

	@OnClick(R.id.btn_minus)
	public void minusClicked() {
		Log.d(TAG, "Minus clicked: "+ getValueA());
		double answer = getValueA() - getValueB();
		tvAnswer.setText(String.valueOf(answer));
	}

	@OnClick(R.id.btn_multiply)
	public void multiplyClicked() {
		Log.d(TAG, "Multiply clicked: "+ getValueA());
		double answer = getValueA() * getValueB();
		tvAnswer.setText(String.valueOf(answer));
	}

	@OnClick(R.id.btn_divide)
	public void divideClicked() {
		Log.d(TAG, "Divide clicked: "+ getValueA());
		double answer = getValueA() / getValueB();
		tvAnswer.setText(String.valueOf(answer));
	}

}
