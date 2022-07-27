package com.github.brownboycodes.nativeuiconcepts

import android.content.Context
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import io.flutter.embedding.android.FlutterActivity;


import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow

import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat.startActivity
import com.github.brownboycodes.nativeuiconcepts.ui.theme.NativeUIConceptsTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            NativeUIConceptsTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    FlutterUIList()
                }
            }
        }
    }

    val pics : Map<String,Int> = mapOf<String,Int>(
         "Philip Davis" to R.mipmap.twitter_profile_pic_of_philipcdavis,
        "Cuberto" to R.mipmap.twitter_profile_pic_of_cuberto,
        "Janum Trivedi" to R.mipmap.twitter_profile_pic_of_janumtrivedi
    )

    data class UIConcepts(val uiName:String,val route:String)
    data class FlutterUIInfo(val author: String, val uiConcepts:List<UIConcepts>)
    val concepts= listOf<FlutterUIInfo>(
        FlutterUIInfo(
            author = "Philip Davis",
            uiConcepts = listOf<UIConcepts>(
                UIConcepts(
                    uiName = "Bottom Sheet Transition",
                    route = "/bottom-sheet-transition"
                )
            )
        ),
        FlutterUIInfo(
            author = "Cuberto",
            uiConcepts = listOf<UIConcepts>(
                UIConcepts(
                    uiName = "Cuberto Liquid Transition",
                    route = "/cuberto-liquid-transition"
                )
            )
        ),
        FlutterUIInfo(
            author = "Janum Trivedi",
            uiConcepts = listOf<UIConcepts>(
                UIConcepts(
                    uiName = "Interactive Toolbar",
                    route = "/interactive-toolbar"
                )
            )
        )
    )

    @Composable
    fun FlutterUIList() {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.background(
                brush = Brush.verticalGradient(
                    colors = listOf<Color>(
//                        Color(0XFF2C5364), Color(0xff203A43), Color(0xff0F2027)
                        Color(0xffFFFFFF), Color(0xffECE9E6)
                    )
                )
            )
        ) {
            Spacer(modifier = Modifier.height(height = 10.dp))
            concepts.map { FlutterUIListTile(flutterUIInfo = it) }
//            FlutterUIListTile(
//                flutterUIInfo = FlutterUIInfo(
//                    author = "Philip Davis",
//                    name = "Bottom Sheet Transition"
//                )
//            )
        }
    }

    @Composable
    fun FlutterUIListTile(flutterUIInfo: FlutterUIInfo) {
        Row(
            horizontalArrangement = Arrangement.Start,
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier
                .wrapContentHeight()
                .background(
                    color = Color.White, shape = RoundedCornerShape(24)

                )
                .padding(5.dp)
                .shadow(elevation = 1.618.dp, shape = RoundedCornerShape(24))
                .fillMaxWidth(fraction = 0.84f)
                .clickable(onClick = { openFlutterApp() })
        ) {
            Spacer(modifier = Modifier.width(10.dp))
            Image(
                painter = painterResource(id = pics[flutterUIInfo.author]!!),
                contentDescription = "profile picture",
                modifier = Modifier
                    .size(56.dp)
                    .clip(
                        CircleShape
                    )
                    .border(width = 1.6.dp, color = Color(0xff2a9d8f), shape = CircleShape)
                    .border(width = 3.dp, color = Color.White, shape = CircleShape)

            )
            Column(modifier = Modifier.padding(24.dp)) {
//                Text(text = flutterUIInfo.name, color = Color(0xff40916c))
                Text(text = flutterUIInfo.author, color = Color(0xff52b788))
            }
        }
    }

    private fun openFlutterApp() {
        startActivity(this, FlutterActivity.createDefaultIntent(this), null)
    }

    @Preview(showBackground = true)
    @Composable
    fun DefaultPreview() {
        NativeUIConceptsTheme {
            Surface(
                modifier = Modifier.fillMaxSize(),
                color = MaterialTheme.colors.background
            ) {
                FlutterUIList()
            }
        }
    }
}