provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-04681163a08179f28"
  instance_type = "t2.micro"

  tags = {
    Name = "AWS-Web-Server"
  }
}

resource "aws_s3_bucket" "static_assets" {
  bucket = "my-static-assets-bucket-aws"
}

resource "aws_lb" "web_lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]

  subnets = ["subnet-0b0d8fa4ae1c6be07","subnet-0cb998e48c9b370b2"]
}

resource "aws_security_group" "lb_sg" {
  name        = "web-lb-sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


provider "google" {
  project = "github-450911"
  region  = "us-central1"
}

resource "google_compute_instance" "web" {
  name         = "gcp-web-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_storage_bucket" "static_assets" {
  name     = "my-static-assets-bucket-gcp"
  location = "US"
}

resource "google_compute_forwarding_rule" "web_lb" {
  name   = "web-lb"
  region = "us-central1"

  load_balancing_scheme = "EXTERNAL"
  target                = google_compute_target_pool.web_pool.self_link
}

resource "google_compute_target_pool" "web_pool" {
  name = "web-pool"
}