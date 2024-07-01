#include "curve.h"
#include "vertexrecorder.h"
using namespace std;

const float c_pi = 3.14159265358979323846f;

namespace
{
// Approximately equal to.  We don't want to use == because of
// precision issues with floating point.
inline bool approx(const Vector3f& lhs, const Vector3f& rhs)
{
	const float eps = 1e-8f;
	return (lhs - rhs).absSquared() < eps;
}


}


Curve evalBezier(const vector< Vector3f >& P, unsigned steps)
{
	if (P.size() < 4 || P.size() % 3 != 1)
	{
		cerr << "evalBezier must be called with 3n+1 control points." << endl;
		exit(0);
	}
	int ngroups = P.size() / 3;
	Curve Bezier(ngroups * steps);

	for (int i = 0; i < ngroups;i++)
	{

		for (int j = 0; j < steps; j++)
		{
			double t = double(j) / steps;
			/*group 0 use points : 0,1,2,3;  group 1 use : 3,4,5,6;... group i use: 3 * i, 3 * i + 1, 3 * i + 2, 3 * i + 3*/
			/*update V, need normalization*/
			Bezier[steps * i + j].V = (1 - t) * (1 - t) * (1 - t) * P[3 * i] + 3 * t * (1 - t) * (1 - t) * P[3 * i + 1] + 3 * t * t * (1 - t) * P[3 * i + 2] + t * t * t * P[3 * i + 3];
			/*update T, need normalization*/
			Bezier[steps * i + j].T = (-3 * (1 - t) * (1 - t) * P[3 * i] + 3 * (1 - 3 * t) * (1 - t) * P[3 * i + 1] + 3 * t * (2 - 3 * t) * P[3 * i + 2] + 3 * t * t * P[3 * i + 3]).normalized();
			/*update N, need special judgement, need normalization*/
			if(!(i == 0 && j == 0)){
				Bezier[steps * i + j].N = Vector3f::cross(Bezier[steps * i + j - 1].B, Bezier[steps * i + j].T).normalized();
			}
			else Bezier[steps * i + j].N = Vector3f::cross(Vector3f(0, 0, 1), Bezier[steps * i + j].T).normalized();
			/*update B, need normalization*/
			Bezier[steps * i + j].B = Vector3f::cross(Bezier[steps * i + j].T, Bezier[steps * i + j].N).normalized();
		}
	}
	return Bezier;
}

Curve evalBspline(const vector< Vector3f >& P, unsigned steps)
{
	// Check
	if (P.size() < 4)
	{
		cerr << "evalBspline must be called with 4 or more control points." << endl;
		exit(0);
	}
	int ngroups = P.size() - 3;
	Curve Bspline(ngroups * steps);

	for (int i = 0; i < ngroups; i++)
	{
		for (int j = 0; j < steps; j++)
		{
			double t = double(j) / steps;
			/*group 0 use points : 0,1,2,3;  group 1 use : 1,2,3,4;... group i use: i,i + 1,i + 2,i + 3*/
			/*update V, need normalization*/
			Bspline[steps * i + j].V = (1 - t) * (1 - t) * (1 - t) / 6.0f * P[i] + (4 - 6 * t * t + 3 * t * t * t) / 6.0f * P[i + 1] + (1 + 3 * t + 3 * t * t - 3 * t * t * t) / 6.0f * P[i + 2] + (t * t * t) / 6.0f * P[i + 3];
			/*update T, need normalization*/
			Bspline[steps * i + j].T = (-(1 - t) * (1 - t) / 2.0f * P[i] + (-4 * t + 3 * t * t) / 2.0f * P[i + 1] + (1 + 2 * t - 3 * t * t) / 2.0f * P[i + 2] + (t * t) / 2.0f * P[i + 3]).normalized();
			/*update N, need special judgement, need normalization*/
			if(!(i == 0 && j == 0)){
				Bspline[steps * i + j].N = Vector3f::cross(Bspline[steps * i + j - 1].B, Bspline[steps * i + j].T).normalized();
			}
			else Bspline[steps * i + j].N = Vector3f::cross(Vector3f(0, 0, 1), Bspline[steps * i + j].T).normalized(); 
			/*update B, need normalization*/
			Bspline[steps * i + j].B = Vector3f::cross(Bspline[steps * i + j].T, Bspline[steps * i + j].N).normalized();
		}
	}
	/*the tail may be connected to head, so need special judgement*/
	if (P[ngroups] == P[0] && P[ngroups + 1] == P[1] && P[ngroups+ 2] == P[2])
		Bspline.push_back(Bspline[0]); 
	return Bspline;
}

Curve evalCircle(float radius, unsigned steps)
{
	// This is a sample function on how to properly initialize a Curve
	// (which is a vector< CurvePoint >).

	// Preallocate a curve with steps+1 CurvePoints
	Curve R(steps + 1);

	// Fill it in counterclockwise
	for (unsigned i = 0; i <= steps; ++i)
	{
		// step from 0 to 2pi
		float t = 2.0f * c_pi * float(i) / steps;

		// Initialize position
		// We're pivoting counterclockwise around the y-axis
		R[i].V = radius * Vector3f(cos(t), sin(t), 0);

		// Tangent vector is first derivative
		R[i].T = Vector3f(-sin(t), cos(t), 0);

		// Normal vector is second derivative
		R[i].N = Vector3f(-cos(t), -sin(t), 0);

		// Finally, binormal is facing up.
		R[i].B = Vector3f(0, 0, 1);
	}

	return R;
}

void recordCurve(const Curve& curve, VertexRecorder* recorder)
{
	const Vector3f WHITE(1, 1, 1);
	for (int i = 0; i < (int)curve.size() - 1; ++i)
	{
		recorder->record_poscolor(curve[i].V, WHITE);
		recorder->record_poscolor(curve[i + 1].V, WHITE);
	}
}
void recordCurveFrames(const Curve& curve, VertexRecorder* recorder, float framesize)
{
	Matrix4f T;
	const Vector3f RED(1, 0, 0);
	const Vector3f GREEN(0, 1, 0);
	const Vector3f BLUE(0, 0, 1);
	
	const Vector4f ORGN(0, 0, 0, 1);
	const Vector4f AXISX(framesize, 0, 0, 1);
	const Vector4f AXISY(0, framesize, 0, 1);
	const Vector4f AXISZ(0, 0, framesize, 1);

	for (int i = 0; i < (int)curve.size(); ++i)
	{
		T.setCol(0, Vector4f(curve[i].N, 0));
		T.setCol(1, Vector4f(curve[i].B, 0));
		T.setCol(2, Vector4f(curve[i].T, 0));
		T.setCol(3, Vector4f(curve[i].V, 1));
 
		// Transform orthogonal frames into model space
		Vector4f MORGN  = T * ORGN;
		Vector4f MAXISX = T * AXISX;
		Vector4f MAXISY = T * AXISY;
		Vector4f MAXISZ = T * AXISZ;

		// Record in model space
		recorder->record_poscolor(MORGN.xyz(), RED);
		recorder->record_poscolor(MAXISX.xyz(), RED);

		recorder->record_poscolor(MORGN.xyz(), GREEN);
		recorder->record_poscolor(MAXISY.xyz(), GREEN);

		recorder->record_poscolor(MORGN.xyz(), BLUE);
		recorder->record_poscolor(MAXISZ.xyz(), BLUE);
	}
}

