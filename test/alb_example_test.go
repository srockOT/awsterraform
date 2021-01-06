package test

import  (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"fmt"
	"testing"
	"time"
	"crypto/tls"
)

func TestAlbExample (t *testing.T) {
	
	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "/home/srock/terraform/aws/examples/alb",
	}
	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	//Get the URL of the ALB
	albDnsName := terraform.OutputRequired(t, opts, "alb_dns_name")
	url := fmt.Sprintf("http://%s", albDnsName)

	// Test that the ALB's default action is working and returns a 404

	expectedStatus := 404
	expectedBody := "404: page not found"

	maxRetries := 10
	timeBetweenRetries := 10 * time.Second

	http_helper.HttpGetWithRetry (
		t,
		url,
		&tls.Config{},
		expectedStatus,
		expectedBody,
		maxRetries,
		timeBetweenRetries,
	)
}
