#include "surf.h"
#include "vertexrecorder.h"
#include "stdio.h"
#include "Vector3f.h"
#include <cmath>
using namespace std;

const float c_pi = 3.14159265358979323846f;

namespace
{
    
    // We're only implenting swept surfaces where the profile curve is
    // flat on the xy-plane.  This is a check function.
    static bool checkFlat(const Curve &profile)
    {
        for (unsigned i=0; i<profile.size(); i++)
            if (profile[i].V[2] != 0.0 ||
                profile[i].T[2] != 0.0 ||
                profile[i].N[2] != 0.0)
                return false;
    
        return true;
    }
}

// DEBUG HELPER
Surface quad() { 
	Surface ret;
	ret.VV.push_back(Vector3f(-1, -1, 0));
	ret.VV.push_back(Vector3f(+1, -1, 0));
	ret.VV.push_back(Vector3f(+1, +1, 0));
	ret.VV.push_back(Vector3f(-1, +1, 0));

	ret.VN.push_back(Vector3f(0, 0, 1));
	ret.VN.push_back(Vector3f(0, 0, 1));
	ret.VN.push_back(Vector3f(0, 0, 1));
	ret.VN.push_back(Vector3f(0, 0, 1));

	ret.VF.push_back(Tup3u(0, 1, 2));
	ret.VF.push_back(Tup3u(0, 2, 3));
	return ret;
}

void InsertTriangle(Surface &surface, const int &sz2)
{   
    /*two input, formed SUrface and size of profiles (need special input)*/
    int i = 0;
    int sz1 = surface.VV.size();
    /*use to size to control*/
    while (i < sz1 - sz2)
    {
        if ((i + 1) % sz2 != 0)
        {   /*according to the define in surf.h*/
            surface.VF.push_back(Tup3u(i, i + 1, i + sz2));
            surface.VF.push_back(Tup3u(i + sz2, i + 1, i + sz2 + 1));
        }
        i++;
    }
}


Surface makeSurfRev(const Curve &profile, unsigned steps)
{
    Surface surface;
    if(!checkFlat(profile))
    {
        cerr << "surfRev profile curve must be flat on xy plane." << endl;
        exit(0);
    }
    int sz2 = profile.size();
    for(int i = 0; i < steps; i++)
    {   
        /*use vecmath api to calculate t / cost / sint, used to rotate */
        double t = 2.0f * c_pi * double(i) / steps;
        double ccos = cos(t);
        double ssin = sin(t);
        /*for every point in profile, advance once per circle */
        for (int j = 0; j < sz2; j++)
        {
            surface.VV.push_back(Vector3f(ccos * profile[j].V[0] + ssin * profile[j].V[2], profile[j].V[1], -ssin * profile[j].V[0] + ccos * profile[j].V[2]));
            surface.VN.push_back(Vector3f(-ccos * profile[j].N[0] - ssin * profile[j].N[2], -profile[j].N[1], ssin * profile[j].N[0] - ccos * profile[j].N[2]));
        }
    }
    for(int k = 0; k < sz2; k++)
    {
        surface.VV.push_back(surface.VV[k]);
        surface.VN.push_back(surface.VN[k]);
    }
    InsertTriangle(surface, sz2);
    return surface;
}

Surface makeGenCyl(const Curve &profile, const Curve &sweep )
{
    Surface surface;
    // surface = quad();

    if(!checkFlat(profile))
    {
        cerr << "genCyl profile curve must be flat on xy plane." << endl;
        exit(0);
    }
    int sz2 = profile.size();
    int sz3 = sweep.size();
    
    Vector3f startNormalized = sweep[0].N.normalized();
    Vector3f endNormalized = sweep[sz3-2].N.normalized();
    double dotProduct = Vector3f::dot(startNormalized,endNormalized);
    double alpha = std::acos(dotProduct);
    printf("alpha is %lf\n",alpha); 
    double angle = std::acos(dotProduct) / (sz3-1);
    bool flag = true;
    if (sweep[0].V != sweep[sz3 - 1].V || alpha < 0.2)
        flag = false;
    printf("flag is %d\n",flag);
    for (int i = 0; i < sz3; i++)
    {   
        int p = i == sz3 - 1 ? sz3 - 1 : sz3 - 2 - i;
        double coss = cos(p*angle), sinn = sin(p*angle);
        Vector3f _N = flag ? coss * sweep[i].N + sinn * sweep[i].B: sweep[i].N;
        Vector3f _B = flag ? coss * sweep[i].B - sinn * sweep[i].N: sweep[i].B;
        Matrix4f Ma(Vector4f(_N, 0), Vector4f(_B, 0), Vector4f(sweep[i].T, 0), Vector4f(sweep[i].V, 1));
        Matrix3f subMa = Ma.getSubmatrix3x3(0, 0);

        for (int j = 0; j < sz2; j++)
        {
            surface.VV.push_back((Ma * Vector4f(profile[j].V, 1)).xyz());
            surface.VN.push_back(-1 * subMa * profile[j].N);
        }
    }
    InsertTriangle(surface, sz2);
    return surface;
}

void recordSurface(const Surface &surface, VertexRecorder* recorder) {
	const Vector3f WIRECOLOR(0.4f, 0.4f, 0.4f);
    for (int i=0; i<(int)surface.VF.size(); i++)
    {
		recorder->record(surface.VV[surface.VF[i][0]], surface.VN[surface.VF[i][0]], WIRECOLOR);
		recorder->record(surface.VV[surface.VF[i][1]], surface.VN[surface.VF[i][1]], WIRECOLOR);
		recorder->record(surface.VV[surface.VF[i][2]], surface.VN[surface.VF[i][2]], WIRECOLOR);
    }
}

void recordNormals(const Surface &surface, VertexRecorder* recorder, float len)
{
	const Vector3f NORMALCOLOR(0, 1, 1);
    for (int i=0; i<(int)surface.VV.size(); i++)
    {
		recorder->record_poscolor(surface.VV[i], NORMALCOLOR);
		recorder->record_poscolor(surface.VV[i] + surface.VN[i] * len, NORMALCOLOR);
    }
}

void outputObjFile(ostream &out, const Surface &surface)
{
    
    for (int i=0; i<(int)surface.VV.size(); i++)
        out << "v  "
            << surface.VV[i][0] << " "
            << surface.VV[i][1] << " "
            << surface.VV[i][2] << endl;

    for (int i=0; i<(int)surface.VN.size(); i++)
        out << "vn "
            << surface.VN[i][0] << " "
            << surface.VN[i][1] << " "
            << surface.VN[i][2] << endl;

    out << "vt  0 0 0" << endl;
    
    for (int i=0; i<(int)surface.VF.size(); i++)
    {
        out << "f  ";
        for (unsigned j=0; j<3; j++)
        {
            unsigned a = surface.VF[i][j]+1;
            out << a << "/" << "1" << "/" << a << " ";
        }
        out << endl;
    }
}
